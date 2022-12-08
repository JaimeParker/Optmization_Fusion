classdef XmlWriter < converter.file.StringWriter
    %XMLWRITER Persists object hierarchies to *.XML markup.
    %
    % xmlWriter = get(Injector, ?converter.file.XmlWriter)
    % xmlFileWriter = get(Injector(fileName), ?converter.file.FileWriter)
    %
    % Serializes cell arrays to <item /> nodes and objects / structs to
    % <item name="..." /> nodes hierarchically. The format is conform with the
    % corresponding XmlReader class.
    %
    % XMLWRITER example 1 input:
    %   value.Fields.Rho = 1.225
    %   value.Clips.A.Tags = {'A', 'B'}
    %   value.Clips.A.Clip = [1 2 3 4 5]
    %
    % XMLWRITER example 1 output:
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
    % XMLWRITER example 2 input:
    %   value = {1x1 NotAPipeClass}
    %
    % XMLWRITER example 2 output:
    %   <?xml version="1.0" encoding="utf-8"?>
    %   <root>
    %     <item type="NotAPipeClass">
    %       <item name="PropertyA" value="ValueA"/>
    %       <item name="PropertyB" value="ValueB"/>
    %     </item>
    %   </root>
    %
    % See also converter.file.FileWriter, converter.file.XmlReader
    
    properties (Access = private)
        Doc; % 1x1 xml document
        ReflectionUtil; % 1x1 converter.util.ReflectionUtil
        StringUtil; % 1x1 converter.util.StringUtil
    end
    
    methods
        function self = XmlWriter(reflectionUtil, stringUtil)
            self.ReflectionUtil = reflectionUtil;
            self.StringUtil = stringUtil;
        end
        
        function contents = write(self, value)
            self.Doc = com.mathworks.xml.XMLUtils.createDocument('root');
            for iItem = 1:length(value)
                node = self.itemNode(value{iItem});
                self.Doc.getDocumentElement().appendChild(node);
            end
            contents = xmlwrite(self.Doc);
        end
    end
    
    methods (Access = private)
        function node = itemNode(self, item)
            node = self.Doc.createElement('item');
            node.setAttribute('type', class(item));
            
            nodes = self.propertyNodes(item);
            for iNode = 1:length(nodes)
                node.appendChild(nodes{iNode});
            end
        end
        
        function nodes = propertyNodes(self, item)
            parentIsObject = isobject(item);
            names = self.ReflectionUtil.properties(item);
            nNames = length(names);
            nodes = cell(1, nNames);
            for iName = 1:nNames
                name = names{iName};
                value = item.(name);
                nodes{iName} = self.valueNode('item', name, value, parentIsObject);
            end
        end
        
        function node = valueNode(self, tagName, name, value, parentIsObject)
            node = self.Doc.createElement(tagName);
            
            [attribute, subNodes] = self.attributeOrSubnodes(value, parentIsObject);
            
            if ~isempty(name)
                node.setAttribute('name', name);
            end
            
            if ~parentIsObject
                node.setAttribute('type', class(value));
            end
            
            if isempty(subNodes)
                node.setAttribute('value', attribute);
            else
                for iNode = 1:length(subNodes)
                    node.appendChild(subNodes{iNode});
                end
            end
        end
        
        function [attribute, nodes] = attributeOrSubnodes(self, value, parentIsObject)
            attribute = ''; nodes = {};
            
            switch class(value)
                case 'logical'
                    attribute = self.StringUtil.log2str(value);
                case 'double'
                    attribute = self.StringUtil.num2str(value);
                case 'struct'
                    if parentIsObject && iscellstr(struct2cell(value));
                        attribute = self.StringUtil.map2str(value);
                    else
                        nodes = self.propertyNodes(value);
                    end
                case 'char'
                    attribute = value;
                case 'cell'
                    if iscellstr(value)
                        attribute = self.StringUtil.list2str(value, false);
                    else
                        node = @(item) self.valueNode('item', '', item, false);
                        nodes = cellfun(node, value, 'Uniform', false);
                    end
                otherwise
                    try
                        attribute = value.char();
                    catch
                        nodes = self.propertyNodes(value);
                    end
            end
        end
    end
end

