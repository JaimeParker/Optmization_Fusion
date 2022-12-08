classdef CheckboxTree < uiextras.jTree.Tree
    % CheckboxTree - Class definition for CheckboxTree
    %   The CheckboxTree object places a checkbox tree control within a
    %   figure or container.
    %
    % Syntax:
    %           tObj = uiextras.jTree.CheckboxTree
    %           tObj = uiextras.jTree.CheckboxTree('Property','Value',...)
    %
    %   The CheckboxTree contains all properties and methods of the
    %   <a href="matlab:doc uiextras.jTree.Tree">uiextras.jTree.Tree</a>, plus the following:
    %
    % CheckboxTree Properties:
    %
    %   CheckboxClickedCallback - callback when a checkbox value is changed
    %
    %   ClickInCheckBoxOnly - if false, clicking on the node's label also
    %   toggles the checkbox value, instead of selecting the node
    %
    %   DigIn - controls whether checkbox selection of a branch also checks
    %   all children
    %
    %   CheckedNodes - tree nodes that are currently checked. In DigIn
    %   mode, this will not contain the children of fully selected
    %   branches. (read-only)
    %
    %
    % CheckboxTree Example:
    %
    %   %% Create the figure and display the tree
    %   f = figure;
    %   t = CheckboxTree('Parent',f,...
    %       'SelectionChangeFcn','disp(''SelectionChangeFcn triggered'')',...
    %       'MultiSelect','on');
    %
    %   %% Create tree nodes
    %   Node1 = uiextras.jTree.CheckboxTreeNode('Name','Node_1','Parent',t.Root);
    %   Node1_1 = uiextras.jTree.CheckboxTreeNode('Name','Node_1_1','Parent',Node1);
    %   Node1_2 = uiextras.jTree.CheckboxTreeNode('Name','Node_1_2','Parent',Node1);
    %   Node2 = uiextras.jTree.CheckboxTreeNode('Name','Node_2','Parent',t.Root);
    %
    %   %% Set an icon
    %   RootIcon = which('matlabicon.gif');
    %   setIcon(Node1,RootIcon)
    %
    %   %% Move nodes around
    %   Node1_2.Parent = t;
    %
    %   %% Disable the tree
    %   t.Enable = 'off';
    %
    %   %% Enable the tree
    %   t.Enable = 'on';
    %
    % See also: uiextras.jTree.Tree, uiextras.jTree.TreeNode,
    %           uiextras.jTree.CheckboxTreeNode
    
    %   Copyright 2012-2014 The MathWorks, Inc.
    %
    % Auth/Revision:
    %   MathWorks Consulting
    %   $Author: rjackey $
    %   $Revision: 109 $  $Date: 2014-09-30 16:42:51 -0400 (Tue, 30 Sep 2014) $
    %
    % Auth/Revision:
    %   Florian Schwaiger
    %   Code formatting and cleanup
    %   2016-02-25
    
    properties (SetAccess=public, GetAccess=public)
        CheckboxClickedCallback
    end
    
    properties (Dependent=true, SetAccess=public, GetAccess=public)
        ClickInCheckBoxOnly
        DigIn
    end
    
    properties (Dependent=true, SetAccess=immutable, GetAccess=public)
        CheckedNodes
    end
    
    properties (SetAccess=protected, GetAccess=protected)
        JavaCheckboxSelectionModel
    end
    
    methods
        function self = CheckboxTree(varargin)
            self = self@uiextras.jTree.Tree(varargin{:});
        end
        
        function isChecked = isNodeChecked(self, node)
            javaTreePath = node.JavaNode.getTreePath();
            isChecked = self.JavaCheckboxSelectionModel ...
                .isPathSelected(javaTreePath, self.DigIn);
        end
        
        function isChecked = isNodePartiallyChecked(self, node)
            javaTreePath = node.JavaNode.getTreePath();
            isChecked = self.JavaCheckboxSelectionModel ...
                .isPartiallySelected(javaTreePath);
        end
        
        function setChecked(self, nodes, areChecked)
            % TODO: removing those nodes messes up the selection paths, if
            % all subnodes of a parent node were checked. removing alle
            % subpaths thenwill not remove the super node path, resulting
            % in unwantedly checked nodes.
            warning('This function has issues, use setCheckedExclusively instead.');
            
            if isscalar(areChecked)
                areChecked = repmat(areChecked, size(nodes));
            elseif ~isequal(size(areChecked), size(nodes))
                error('CheckboxTree:setChecked:inputs',...
                    'Size of value must match size of input nodes to be set.');
            end
            
            self.disableCallbacks();
            
            nodesToRemove = nodes(~areChecked);
            nodesToAdd = nodes(areChecked);
            
            if ~isempty(nodesToRemove)
                for index = numel(nodesToRemove):-1:1 %backwards to preallocate
                    pathsToRemove(index) = nodesToRemove(index).CachedTreePath;
                end
                self.JavaCheckboxSelectionModel.removeSelectionPaths(pathsToRemove);
            end
            
            if ~isempty(nodesToAdd)
                for index = numel(nodesToAdd):-1:1 %backwards to preallocate
                    pathsToAdd(index) = nodesToAdd(index).CachedTreePath;
                end
                self.JavaCheckboxSelectionModel.setSelectionPaths(pathsToAdd);
            end
            
            self.enableCallbacks();
        end
        
        function setCheckedExclusively(self, nodes)
            self.disableCallbacks();
            
            if isempty(nodes)
                self.JavaCheckboxSelectionModel.clearSelection();
            else
                for index = numel(nodes):-1:1
                    pathsToAdd(index) = nodes(index).CachedTreePath;
                end
                self.JavaCheckboxSelectionModel.setSelectionPaths(pathsToAdd);
            end
            
            self.enableCallbacks();
        end
        
        function clickOnly = get.ClickInCheckBoxOnly(self)
            clickOnly = get(self.JavaTree, 'ClickInCheckBoxOnly');
        end
        
        function set.ClickInCheckBoxOnly(self, clickOnly)
            self.JavaTree.setClickInCheckBoxOnly(clickOnly);
        end
        
        function digIn = get.DigIn(self)
            digIn = get(self.JavaTree, 'DigIn');
        end
        
        function set.DigIn(self, digIn)
            self.JavaTree.setDigIn(digIn);
        end
        
        function checkedNodes = get.CheckedNodes(self)
            selectedPaths = self.JavaCheckboxSelectionModel.getSelectionPaths();
            checkedNodes = [];
            
            for index = 1:numel(selectedPaths)
                javaNode = selectedPaths(index).getLastPathComponent();
                node = get(javaNode, 'TreeNode');
                checkedNodes = [checkedNodes, node]; %#ok<AGROW>
            end
        end
    end
    
    methods (Access = protected)
        function createTree(self)
            self.Root = uiextras.jTree.CheckboxTreeNode( ...
                'Name', 'Root', 'Tree', self);
            self.JavaTree = javaObjectEDT('UIExtrasTree.CheckBoxTree', ...
                self.Root.JavaNode);
            
            self.JavaModel = self.JavaTree.getModel();
            javaObjectEDT(self.JavaModel);
            
            self.JavaSelectionModel = self.JavaTree.getSelectionModel();
            javaObjectEDT(self.JavaSelectionModel);
            
            self.JavaCheckboxSelectionModel = self.JavaTree.getCheckBoxTreeSelectionModel();
            javaObjectEDT(self.JavaCheckboxSelectionModel);
        end
        
        function createTreeCustomizations(self)
            createTreeCustomizations@uiextras.jTree.Tree(self)
            
            self.JavaTree.setCellRenderer(UIExtrasTree.TreeCellRenderer);
            self.JavaCheckboxSelectionModel.setSingleEventMode(true);
            
            callbacks = handle(self.JavaCheckboxSelectionModel, 'CallbackProperties');
            set(callbacks, 'ValueChangedCallback', @self.onCheckboxClicked)
        end
        
        function onCheckboxClicked(self, ~, ~)
            if self.areCallbacksEnabled() ...
                    && ~isempty(self.CheckboxClickedCallback)
                hgfeval(self.CheckboxClickedCallback, self);
            end
        end
    end
end

