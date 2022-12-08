classdef TreeNode < hgsetget & matlab.mixin.Heterogeneous
    % TreeNode - Defines a node for a tree control
    %   The TreeNode object defines a tree node to be placed on a
    %   uiextras.jTree.Tree control.
    %
    % Syntax:
    %   node = uiextras.jTree.TreeNode
    %   node = uiextras.jTree.TreeNode('Property','Value',...)
    %
    % TreeNode Properties:
    %
    %   Name - Name to display on the tree node
    %   Value - User value to store in the tree node
    %   TooltipString - Tooltip text on mouse hover
    %   UserData - User data to store in the tree node
    %   Parent - Parent tree node
    %   UIContextMenu - context menu to show when clicking on this node
    %   Children - Child tree nodes (read-only)
    %   Tree - Tree on which this node is attached (read-only)
    %
    % TreeNode Methods:
    %
    %   copy - makes a copy of the node for use in another tree
    %   collapse - collapse the node
    %   expand - expand the node
    %   isAncestor - checks if another node is an ancestor of this one
    %   isDescendant - checks if another node is a descendant of this one
    %   setIcon - set the icon displayed on this tree node
    %
    % See also: uiextras.jTree.Tree, uiextras.jTree.CheckboxTree,
    %           uiextras.jTree.CheckboxTreeNode
    
    % Copyright 2012-2015 The MathWorks, Inc.
    %
    % Auth/Revision:
    %   MathWorks Consulting
    %   $Author: rjackey $
    %   $Revision: 1245 $  $Date: 2015-11-06 09:19:24 -0500 (Fri, 06 Nov 2015) $
    %
    % Auth/Revision:
    %   Florian Schwaiger
    %   Code formatting and cleanup
    %   2016-02-25
    
    properties (Dependent=true)
        Name
        Value
        TooltipString
        UserData
    end
    
    properties
        Parent
        UIContextMenu
    end
    
    properties (SetAccess = protected)
        Children = uiextras.jTree.TreeNode.empty(1, 0);
        Tree
        CachedTreePath
    end
    
    properties (Access = {?uiextras.jTree.Tree, ?uiextras.jTree.TreeNode})
        JavaNode
    end
    
    methods
        function self = TreeNode(varargin)
            self.JavaNode = handle(javaObjectEDT('UIExtrasTree.TreeNode'));
            
            % Add properties to the java object for MATLAB data
            schema.prop(self.JavaNode, 'Value', 'MATLAB array');
            schema.prop(self.JavaNode, 'TreeNode', 'MATLAB array');
            schema.prop(self.JavaNode, 'UserData', 'MATLAB array');
            
            self.JavaNode.TreeNode = self;
            
            % Set user-supplied property values
            if ~isempty(varargin)
                set(self, varargin{:});
            end
        end
        
        function delete(self)
            delete(self.Children(isvalid(self.Children)));
            delete(self.JavaNode);
            
            self.Children = [];
            self.Parent = [];
        end
        
        function copiedNodes = copy(nodes, newParent)
            for index = 1:numel(nodes)
                nodeConstructorFcn = str2func(class(nodes(index)));
                
                copiedNodes(index) = nodeConstructorFcn( ...
                    'Name',          nodes(index).Name, ...
                    'Value',         nodes(index).Value, ...
                    'TooltipString', nodes(index).TooltipString, ...
                    'UserData',      nodes(index).UserData, ...
                    'UIContextMenu', nodes(index).UIContextMenu); %#ok<AGROW>
                
                javaIcon = nodes(index).JavaNode.getIcon();
                copiedNodes(index).JavaNode.setIcon(javaIcon);
                
                if nargin > 1
                    copiedNodes(index).Parent = newParent; %#ok<AGROW>
                end
                
                childNodes = nodes(index).Children;
                for childIndex = 1:numel(childNodes)
                    copy(childNodes(childIndex), copiedNodes(index));
                end
            end
        end
        
        function collapse(nodes)
            for index = 1:numel(nodes)
                if ~isempty(nodes(index).Tree)
                    nodes(index).Tree.collapseNode(nodes(index));
                end
            end
        end
        
        function expand(nodes)
            for index = 1:numel(nodes)
                if ~isempty(nodes(index).Tree)
                    nodes(index).Tree.expandNode(nodes(index));
                end
            end
        end
        
        function isAncestor = isAncestor(self, ancestor)
            isAncestor = false(size(self));
            for index = 1:numel(self)
                while ~isAncestor(index) && ~isempty(self(index).Parent)
                    isAncestor(index) = any(self(index).Parent == ancestor);
                    self(index) = self(index).Parent;
                end
            end
        end
        
        function isDescendant = isDescendant(self, descendant)
            isDescendant = isAncestor(descendant, self);
        end
        
        function setIcon(self, iconFilePath)
            iconData = javaObjectEDT('javax.swing.ImageIcon', iconFilePath);
            self.JavaNode.setIcon(iconData);
            
            if ~isempty(self.Tree) && ishandle(self.Tree)
                self.Tree.nodeChanged(self);
            end
        end
        
        function name = get.Name(self)
            name = self.JavaNode.getUserObject();
        end
        
        function set.Name(self, name)
            self.JavaNode.setUserObject(name);
            
            if ~isempty(self.Tree) && ishandle(self.Tree)
                self.Tree.nodeChanged(self);
            end
        end
        
        function value = get.Value(self)
            value = self.JavaNode.Value;
        end
        
        function set.Value(self, value)
            self.JavaNode.Value = value;
        end
        
        function tooltip = get.TooltipString(self)
            tooltip = char(self.JavaNode.getTooltipString());
        end
        
        function set.TooltipString(self, tooltip)
            self.JavaNode.setTooltipString(java.lang.String(tooltip));
        end
        
        function userData = get.UserData(self)
            userData = self.JavaNode.UserData;
        end
        
        function set.UserData(self, userData)
            self.JavaNode.UserData = userData;
        end
        
        function set.Parent(self, newParent)
            newParent = self.updateParent(newParent);
            self.Parent = newParent;
        end
        
        function set.UIContextMenu(self, uiContextMenu)
            self.UIContextMenu = uiContextMenu;
        end
    end
    
    methods (Access = protected)
        function newParent = updateParent(self, newParent)
            if isempty(newParent)
                self.cleanUpOldParent();
                self.updateTreeReference([]);
            else
                if isa(newParent, 'uiextras.jTree.Tree')
                    newParent = newParent.Root;
                end
                
                self.cleanUpOldParent();
                self.updateTreeReference(newParent.Tree);
                
                childIndex = numel(newParent.Children) + 1;
                newParent.Children(childIndex) = self;
                
                self.Tree.insertNode(self, newParent, childIndex);
            end
            
            if ~isempty(self.JavaNode) && ishandle(self.JavaNode)
                self.CachedTreePath = self.JavaNode.getTreePath();
            else
                self.CachedTreePath = [];
            end
        end
    end
    
    methods (Access = private)
        function cleanUpOldParent(self)
            if ~isempty(self.Parent)
                childIndex = find(self.Parent.Children == self, 1);
                self.Parent.Children(childIndex) = [];
                
                self.Tree.removeNode(self);
            end
        end
        
        function updateTreeReference(nodes, tree)
            for index = 1:numel(nodes)
                nodes(index).Tree = tree;
                
                if ~isempty(nodes(index).Children)
                    nodes(index).Children.updateTreeReference(tree);
                end
            end
        end
    end
end

