classdef XmlReader < converter.file.StringReader
    %XMLREADER Loads object hierarchies from *.XML markup.
    %
    % xmlReader = get(Injector, ?converter.file.XmlReader)
    % xmlFileReader = get(Injector(fileName), ?converter.file.FileReader)
    %
    % Loads serialized cell arrays from <item /> and objects / structs from
    % <item name="..." /> nodes hierarchically. The format is conform with the
    % corresponding XmlWriter class.
    %
    % All constructor dependencies on object definitions will be resolved
    % automatically using the dependency Injector.
    %
    % The <include file="" /> tag allows to distribute the configuration across
    % multiple files. During parsing, the <include> tag is simply replaced by
    % the root node of the loaded file. That root node may be a <merge> tag.
    %
    % The <merge /> tag pulls its children up one hierarchy level. If used as
    % root tag in an <include>d file, its contents are imported directly. Else
    % the contents will remain below the included root node.
    %
    % Tags summary (optionals marked with '(...)?'):
    %   <item (type="...")? (name="...")? (value="...")? />
    %   <property name="..." (type="...")? (value="...")? />
    %   <include file="..." />
    %   <merge />
    %
    % XMLREADER example 1 file:
    %   <?xml version="1.0" encoding="utf-8"?>
    %   <root>
    %     <item name="Fields">
    %       <item name="Rho" type="double" value="1.225" />
    %     </item>
    %     <item name="Clips">
    %       <item name="Tags" type="cell" value="A,B" />
    %       <item name="Clip" type="double" value="1:5" />
    %     </item>
    %   </root>
    %
    % XMLREADER example 1 result:
    %   result.Fields.Rho = 1.225
    %   result.Clips.A.Tags = {'A', 'B'}
    %   result.Clips.A.Clip = [1 2 3 4 5]
    %
    % XMLREADER example 2 file:
    %   <?xml version="1.0" encoding="utf-8"?>
    %   <root>
    %     <item type="NotAPipeClass">
    %       <item name="PropertyA" value="ValueA"/>
    %       <item name="PropertyB" value="ValueB"/>
    %     </item>
    %   </root>
    %
    % XMLREADER example 2 result:
    %   result = {1x1 NotAPipeClass}
    %
    % XMLREADER example 3 file:
    %   <?xml version="1.0" encoding="utf-8"?>
    %   <root>
    %     <item name="Fields">
    %       <item name="Rho" type="double" value="1.225" />
    %     </item>
    %     <include file="Another.xml" />
    %   </root>
    %
    % Another.xml contents:
    %   <?xml version="1.0" encoding="utf-8"?>
    %   <merge>
    %     <item name="Clips">
    %       <item name="Tags" type="cell" value="A,B" />
    %       <item name="Clip" type="double" value="1:5" />
    %     </item>
    %   </merge>
    %
    % XMLREADER example 3 result:
    %   result.Fields.Rho = 1.225
    %   result.Clips.A.Tags = {'A', 'B'}
    %   result.Clips.A.Clip = [1 2 3 4 5]
    %
    % See also converter.file.FileReader, Injector
    
    properties (Access = private)
        StringUtil; % 1x1 converter.util.StringUtil
    end
    
    methods
        function self = XmlReader(stringUtil)
            self.StringUtil = stringUtil;
        end
        
        function value = read(self, string)
            javaString = java.lang.String(string);
            javaInput = java.io.ByteArrayInputStream(javaString.getBytes());
            xmlDocument = xmlread(javaInput);
            
            nodeList = xmlDocument.getDocumentElement().getChildNodes();
            value = self.valueFromNodeList(nodeList, struct());
        end
    end
    
    methods (Access = private)
        function value = valueFromNodeList(self, nodeList, value)
            for iItem = 1:nodeList.getLength()
                [node, name] = resolveIncludeNode(nodeList.item(iItem - 1));
                
                switch name
                    case {'#text', '#comment'}
                        % ignore
                    case 'merge'
                        value = self.resolveMergeNode(node, value);
                    otherwise
                        value = self.resolveItemNode(node, value);
                end
            end
        end
        
        function value = resolveMergeNode(self, node, parent)
            childNodes = node.getChildNodes();
            value = self.valueFromNodeList(childNodes, parent);
        end
        
        function value = resolveItemNode(self, node, value)
            nameAttribute = char(node.getAttribute('name'));
            typeAttribute = char(node.getAttribute('type'));
            
            try
                charType = class(value.(nameAttribute));
            catch
                charType = typeAttribute;
            end
            
            charValue = char(node.getAttribute('value'));
            item = self.StringUtil.str2target(charValue, charType);
            item = self.valueFromNodeList(node.getChildNodes(), item);
            
            if ~isempty(nameAttribute)
                value.(nameAttribute) = item;
            elseif iscell(value)
                value{end + 1} = item;
            else
                value = {item};
            end
        end
    end
end

function [node, name] = resolveIncludeNode(node)
name = char(node.getNodeName());

if strcmp(name, 'include')
    includedFileName = char(node.getAttribute('file'));
    includedDocument = xmlread(includedFileName);
    
    node = includedDocument.getDocumentElement();
    name = char(node.getNodeName());
end
end
