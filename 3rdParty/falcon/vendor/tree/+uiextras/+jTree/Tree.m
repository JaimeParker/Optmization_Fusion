classdef Tree < hgsetget
    % Tree - Class definition for Tree
    %   The Tree object places a tree control within a figure or
    %   container.
    %
    % Syntax:
    %   nObj = uiextras.jTree.Tree
    %   nObj = uiextras.jTree.Tree('Property','Value',...)
    %
    % Tree Properties:
    %
    %   BackgroundColor - controls background color of the tree
    %   DragAndDropEnabled - controls whether drag and drop is enabled on the tree
    %   Enable - controls whether the tree is enabled or disabled
    %   Editable - controls whether the tree node text is editable
    %   FontAngle - font angle [normal|italic]
    %   FontName - font name [string]
    %   FontSize - font size [numeric]
    %   FontWeight - font weight [normal|bold]
    %   Parent - handle graphics parent for the tree, which should be
    %       a valid container including figure, uipanel, or uitab
    %   Position - position of the tree within the parent container
    %   RootVisible - whether the root is visible or not
    %   SelectedNodes - tree nodes that are currently selected
    %   SelectionType - selection mode string ('single', 'contiguous', or
    %       'discontiguous')
    %   Tag - tag assigned to the tree container
    %   Units - units of the tree container, used for determining the
    %       position
    %   UserData - User data to store in the tree node
    %   Visible - controls visibility of the control
    %   ButtonUpFcn - callback when the mouse button goes up over the tree
    %   ButtonDownFcn - callback when the mouse button clicks on the tree
    %   MouseClickedCallback - callback when the mouse clicks on the tree
    %   MouseMotionFcn - callback while the mouse is moved over the tree
    %   NodeDraggedCallback - callback for a node being dragged. A custom
    %       callback should return a logical true when the node being dragged
    %       over is a valid drop target.
    %   NodeDroppedCallback - callback for a node being dropped. A custom
    %       callback should handle the data transfer. If not specified,
    %       dragging and dropping nodes just modifies the parent of the nodes
    %       that were dragged and dropped.
    %   NodeExpandedCallback - callback for a node being expanded
    %   NodeCollapsedCallback - callback for a node being collapsed
    %   NodeEditedCallback - callback for a node being edited
    %   SelectionChangeFcn - callback for change in tree node selection
    %   UIContextMenu - context menu to show when clicking anywhere
    %       within the tree control
    %   Root - the root tree node
    %
    % Tree Example:
    %
    %   %% Create the figure and display the tree
    %   f = figure;
    %   t = uiextras.jTree.Tree('Parent',f,...
    %       'SelectionChangeFcn','disp(''SelectionChangeFcn triggered'')');
    %
    %   %% Create tree nodes
    %   Node1 = uiextras.jTree.TreeNode('Name','Node_1','Parent',t.Root);
    %   Node1_1 = uiextras.jTree.TreeNode('Name','Node_1_1','Parent',Node1);
    %   Node1_2 = uiextras.jTree.TreeNode('Name','Node_1_2','Parent',Node1);
    %   Node2 = uiextras.jTree.TreeNode('Name','Node_2','Parent',t.Root);
    %
    %   %% Set an icon
    %   RootIcon = which('matlabicon.gif');
    %   setIcon(Node1,RootIcon)
    %
    %   %% Move nodes around
    %   Node1_2.Parent = t;
    %
    % See also: uiextras.jTree.CheckboxTree, uiextras.jTree.TreeNode,
    %           uiextras.jTree.CheckboxTreeNode
    
    %   Copyright 2012-2014 The MathWorks, Inc.
    %
    % Auth/Revision:
    %   MathWorks Consulting
    %   $Author: rjackey $
    %   $Revision: 1063 $  $Date: 2015-01-15 14:23:13 -0500 (Thu, 15 Jan 2015) $
    %
    % Auth/Revision:
    %   Florian Schwaiger
    %   Code formatting and cleanup
    %   2016-02-25
    
    properties (Dependent = true)
        BackgroundColor
        Enable
        Editable
        FontAngle
        FontName
        FontSize
        FontWeight
        Parent
        Position
        RootVisible
        SelectedNodes
        SelectionType
        Tag
        Units
        UserData
        Visible
    end
    
    properties
        ButtonUpFcn
        ButtonDownFcn
        MouseClickedCallback
        MouseMotionFcn
        NodeExpandedCallback
        NodeCollapsedCallback
        SelectionChangeFcn
        UIContextMenu
    end
    
    properties (SetAccess = protected)
        Root
    end
    
    properties (Access = {?uiextras.jTree.Tree, ?uiextras.jTree.TreeNode})
        JavaTree
    end
    
    properties (Access = protected)
        HgPanel
        HgJavaContainer
        JavaModel
        JavaSelectionModel
        JavaScrollPane
        JavaCellRenderer
        
        IsConstructed = false;
        IsCallbackEnabled = false;
    end
    
    methods
        function self = Tree(varargin)
            %----- Parse Inputs -----%
            parser = inputParser;
            parser.KeepUnmatched = true;
            parser.addParameter('FontAngle', 'normal');
            parser.addParameter('FontName', 'MS Sans Serif');
            parser.addParameter('FontSize', 10);
            parser.addParameter('FontWeight', 'normal');
            parser.addParameter('Parent', []);
            parser.addParameter('Units', 'normalized');
            parser.addParameter('Position', [0 0 1 1]);
            parser.parse(varargin{:});
            
            %----- Create Graphics -----%
            self.createTree();
            self.createTreeContainer(parser.Results.Parent);
            self.createTreeCustomizations();
            
            % Use the custom renderer
            self.JavaCellRenderer = javaObjectEDT('UIExtrasTree.TreeCellRenderer');
            self.JavaTree.setCellRenderer(self.JavaCellRenderer);
            
            % Add properties to the java object for MATLAB data
            treeHandle = handle(self.JavaTree);
            schema.prop(treeHandle, 'Tree', 'MATLAB array');
            schema.prop(treeHandle, 'UserData', 'MATLAB array');
            treeHandle.Tree = self;
            
            % Refresh the tree
            self.reload(self.Root);
            
            %----- Set Remaining Inputs -----%
            propertiesToSet = rmfield(parser.Results, ...
                {'Parent', 'Position', 'Units'});
            self.set(propertiesToSet);
            
            % Set remaining user-supplied property values
            if ~isempty(fieldnames(parser.Unmatched))
                self.set(parser.Unmatched);
            end
            
            self.IsConstructed = true;
            self.enableCallbacks();
        end
        
        function delete(self)
            self.disableCallbacks();
            
            delete(self.Root);
            
            self.JavaTree = [];
            self.JavaModel = [];
            self.JavaSelectionModel = [];
            self.JavaScrollPane = [];
            self.HgJavaContainer = [];
            
            if ishandle(self.HgPanel)
                delete(self.HgPanel);
            end
        end
        
        function refresh(self, nodes)
            if nargin < 2
                nodes = self.Root;
            end
            
            self.executeWithoutCallbacks(@() self.reload(nodes));
        end
        
        function reload(self, nodes)
            if ~isempty(self.JavaModel) && ishandle(nodes.JavaNode)
                self.executeWithoutCallbacks( ...
                    @() self.JavaModel.reload(nodes.JavaNode));
            end
        end
        
        function nodeChanged(self, nodes)
            if ~isempty(self.JavaModel) && ishandle(nodes.JavaNode)
                self.executeWithoutCallbacks( ...
                    @() self.JavaModel.nodeChanged(nodes.JavaNode));
            end
        end
        
        function insertNode(self, node, parent, index)
            self.executeWithoutCallbacks(@insert);
            
            function insert()
                self.JavaModel.insertNodeInto(node.JavaNode, parent.JavaNode, index-1);
                if isscalar(parent.Children)
                    self.JavaModel.reload(parent.JavaNode);
                end
            end
        end
        
        function removeNode(self, node)
            if ~isempty(self.JavaModel) && ishandle(node.JavaNode)
                self.executeWithoutCallbacks( ...
                    @() self.JavaModel.removeNodeFromParent(nodes.JavaNode));
            end
        end
        
        function collapseNode(self, node)
            self.executeWithoutCallbacks( ...
                @() self.JavaTree.collapsePath(node.JavaNode.getTreePath()));
        end
        
        function expandNode(self, node)
            self.executeWithoutCallbacks( ...
                @() self.JavaTree.expandPath(node.JavaNode.getTreePath()));
        end
        
        function color = get.BackgroundColor(self)
            color = self.JavaTree.getBackground();
            color = [color.getRed(), color.getGreen(), color.getBlue()] / 255;
        end
        
        function set.BackgroundColor(self, color)
            color = java.awt.Color(color(1), color(2), color(3));
            
            self.JavaCellRenderer.setBackgroundNonSelectionColor(color);
            self.JavaTree.setBackground(color);
            self.JavaTree.repaint();
        end
        
        function set.IsCallbackEnabled(self, enabled)
            % drawnow flushes the event queue so no callbacks will be
            % executed after the value has changed. This ensures that the
            % new value will have an immediate effect, as there might
            % still be events in the queue that would not be affected
            % otherwise (example: changing checkbox values queues
            % OnCheckboxValueChanged events which need to be flushed before
            % the callbacks are reenabled again to prevent automated
            % checkbox updates from triggering user callbacks)
            %
            % self.IsCallbackEnabled = false;
            % self.setChecked(nodes, values); % <- events are queued
            % self.IsCallbackEnabled = true;  % <- queue is flushed before
            %                                 % <- no events remain
            %
            % The above will not call onCheckboxClicked() during the
            % automated update, but will capture user mouse clicks.
            
            drawnow;
            self.IsCallbackEnabled = enabled;
        end
        
        function value = get.Editable(self)
            value = get(self.JavaTree, 'Editable');
        end
        
        function set.Editable(self, editable)
            if ischar(editable)
                editable = strcmp(editable,'on');
            end
            
            self.JavaTree.setEditable(editable);
        end
        
        function enabled = get.Enable(self)
            enabled = get(self.JavaTree, 'Enabled');
        end
        
        function set.Enable(self, enable)
            if ischar(enable)
                enable = strcmp(enable,'on');
            end
            
            verticalBar = javaObjectEDT(get(self.JavaScrollPane, 'VerticalScrollBar'));
            horizontalBar = javaObjectEDT(get(self.JavaScrollPane, 'HorizontalScrollBar'));
            
            self.JavaTree.setEnabled(enable);
            verticalBar.setEnabled(enable);
            horizontalBar.setEnabled(enable);
        end
        
        function angle = get.FontAngle(self)
            switch self.JavaTree.getFont().isItalic()
                case true
                    angle = 'italic';
                case false
                    angle = 'normal';
            end
        end
        
        function set.FontAngle(self, angle)
            font = self.JavaTree.getFont();
            
            switch angle
                case 'normal'
                    style = java.awt.Font.BOLD * font.isBold();
                case 'italic'
                    style = java.awt.Font.BOLD * font.isBold() + ...
                        java.awt.Font.ITALIC;
                case 'oblique'
                    error('uiextras:Tree:InvalidArgument', ...
                        'Value ''%s'' is not supported for property ''%s''.', ...
                        angle, 'FontAngle')
                otherwise
                    error('uiextras:Tree:InvalidArgument', ...
                        'Property ''FontAngle'' must be %s.', ...
                        '''normal'' or ''italic''')
            end
            
            font = javax.swing.plaf.FontUIResource( ...
                font.getName(), style, font.getSize());
            self.JavaTree.setFont(font);
        end
        
        function name = get.FontName(self)
            name = char(self.JavaTree.getFont().getName());
        end
        
        function set.FontName(self, name)
            font = self.JavaTree.getFont();
            self.JavaTree.setFont(javax.swing.plaf.FontUIResource(...
                name, font.getStyle(), font.getSize()));
        end
        
        function size = get.FontSize(self)
            size = self.JavaTree.getFont().getSize();
            
            % Convert value from pixels to points
            % http://stackoverflow.com/questions/6257784/java-font-size-vs-html-font-size
            % Java font is in pixels, and assumes 72dpi. Windows is
            % typically 96 and up, depending on display settings.
            
            % Also, Matlab issues a warning if the toolkit variable is inlined.
            % "Subscripting a Java Function will be removed in a future version".
            % So keep the "toolkit" variable separate and all will be fine.
            toolkit = java.awt.Toolkit.getDefaultToolkit();
            dpi = toolkit.getScreenResolution();
            size = (size * 72 / dpi);
        end
        
        function set.FontSize(self, size)
            font = self.JavaTree.getFont();
            
            % Convert value from points to pixels. Matlab issues a warning if the
            % toolkit variable is inlined. "Subscripting a Java Function will be
            % removed in a future version". So keep the variable separate.
            toolkit = java.awt.Toolkit.getDefaultToolkit();
            dpi = toolkit.getScreenResolution();
            size = round(size * dpi / 72);
            
            font = javax.swing.plaf.FontUIResource( ...
                font.getName(), font.getStyle(), size);
            self.JavaTree.setFont(font);
        end
        
        function weight = get.FontWeight(self)
            switch self.JavaTree.getFont().isBold()
                case true
                    weight = 'bold';
                case false
                    weight = 'normal';
            end
        end
        
        function set.FontWeight(self, weight)
            font = self.JavaTree.getFont();
            
            switch weight
                case 'normal'
                    style = font.isItalic() * java.awt.Font.ITALIC;
                case 'bold'
                    style = font.isItalic() * java.awt.Font.ITALIC + ...
                        java.awt.Font.BOLD;
                case {'light','demi'}
                    error('uiextras:Tree:InvalidArgument', ...
                        'Value ''%s'' is not supported for property ''%s''.', ...
                        weight, 'FontWeight')
                otherwise
                    error('uiextras:Tree:InvalidArgument', ...
                        'Property ''FontWeight'' must be %s.', ...
                        '''normal'' or ''bold''')
            end
            
            font = javax.swing.plaf.FontUIResource( ...
                font.getName(), style, font.getSize());
            self.JavaTree.setFont(font);
        end
        
        function parent = get.Parent(self)
            parent = get(self.HgPanel, 'Parent');
        end
        
        function set.Parent(self, parent)
            set(self.HgPanel, 'Parent', double(parent));
        end
        
        function position = get.Position(self)
            position = get(self.HgPanel, 'Position');
        end
        
        function set.Position(self, position)
            set(self.HgPanel, 'Position', position);
        end
        
        function rootVisible = get.RootVisible(self)
            rootVisible = get(self.JavaTree, 'RootVisible');
        end
        
        function set.RootVisible(self,rootVisible)
            if ischar(rootVisible)
                rootVisible = strcmp(rootVisible,'on');
            end
            
            self.JavaTree.setRootVisible(rootVisible);
            self.JavaTree.setShowsRootHandles(~rootVisible);
        end
        
        function selectedNodes = get.SelectedNodes(self)
            selectedNodes = [];
            paths = self.JavaTree.getSelectionPaths();
            for index = 1:numel(paths)
                javaNode = paths(index).getLastPathComponent();
                node = get(javaNode, 'TreeNode');
                selectedNodes = [selectedNodes, node]; %#ok<AGROW>
            end
        end
        
        function set.SelectedNodes(self, selectedNodes)
            if isempty(selectedNodes)
                if ~isempty(self.JavaTree.getSelectionPath())
                    self.executeWithoutCallbacks( ...
                        @() self.JavaTree.setSelectionPath([]));
                end
            elseif isa(selectedNodes,'uiextras.jTree.TreeNode')
                if isscalar(selectedNodes)
                    path = selectedNodes.JavaNode.getTreePath();
                    self.executeWithoutCallbacks( ...
                        @() self.JavaTree.setSelectionPath(path));
                else
                    for index = numel(selectedNodes):-1:1 %preallocate by reversing
                        path(index) = selectedNodes(index).JavaNode.getTreePath();
                    end
                    
                    self.executeWithoutCallbacks( ...
                        @() self.JavaTree.setSelectionPaths(path));
                end
            else
                error('Expected TreeNode or empty array');
            end
        end
        
        function selectionType = get.SelectionType(self)
            encodedType = self.JavaSelectionModel.getSelectionMode();
            switch encodedType
                case 1
                    selectionType = 'single';
                case 2
                    selectionType = 'contiguous';
                case 4
                    selectionType = 'discontiguous';
            end
        end
        
        function set.SelectionType(self, selectionType)
            switch selectionType
                case 'single'
                    mode = self.JavaSelectionModel.SINGLE_TREE_SELECTION;
                case 'contiguous'
                    mode = self.JavaSelectionModel.CONTIGUOUS_TREE_SELECTION;
                case 'discontiguous'
                    mode = self.JavaSelectionModel.DISCONTIGUOUS_TREE_SELECTION;
            end
            
            self.executeWithoutCallbacks( ...
                @() self.JavaSelectionModel.setSelectionMode(mode));
        end
        
        function tag = get.Tag(self)
            tag = get(self.HgPanel, 'Tag');
        end
        
        function set.Tag(self, tag)
            set(self.HgPanel, 'Tag', tag);
        end
        
        function userData = get.UserData(self)
            userData = get(self.JavaTree, 'UserData');
        end
        
        function set.UserData(self, userData)
            set(self.JavaTree, 'UserData', userData);
        end
        
        function units = get.Units(self)
            units = get(self.HgPanel, 'Units');
        end
        
        function set.Units(self, units)
            set(self.HgPanel, 'Units', units);
        end
        
        function visible = get.Visible(self)
            visible = get(self.JavaTree, 'Visible');
        end
        
        function set.Visible(self, visible)
            if ischar(visible)
                visible = strcmp(visible,'on');
            end
            
            self.JavaTree.setVisible(visible);
        end
        
        function set.UIContextMenu(self, uiContextMenu)
            if numel(uiContextMenu) > 1 || ~ishghandle(uiContextMenu)
                error('Expected UIContextMenu handle')
            end
            
            self.UIContextMenu = uiContextMenu;
        end
        
        function enableCallbacks(self)
            self.IsCallbackEnabled = true;
        end
        
        function disableCallbacks(self)
            self.IsCallbackEnabled = false;
        end
    end
    
    methods (Access = protected)
        function createTree(self)
            self.Root = uiextras.jTree.TreeNode( ...
                'Name', 'Root', 'Tree', self);
            self.JavaTree = javaObjectEDT('javax.swing.JTree', ...
                self.Root.JavaNode);
            
            self.JavaModel = self.JavaTree.getModel();
            javaObjectEDT(self.JavaModel);
            
            self.JavaSelectionModel = self.JavaTree.getSelectionModel();
            javaObjectEDT(self.JavaSelectionModel);
        end
        
        function createTreeContainer(self, parent)
            self.HgPanel = uipanel(...
                'Parent', double(parent),...
                'BorderType', 'none',...
                'Clipping', 'on',...
                'DeleteFcn', @(~, ~) self.delete(),...
                'Visible', 'on',...
                'UserData', self);
            
            self.JavaScrollPane = javaObjectEDT('com.mathworks.mwswing.MJScrollPane',self.JavaTree);
            [~, self.HgJavaContainer] = javacomponent(self.JavaScrollPane, [0 0 100 100], self.HgPanel);
            
            self.HgJavaContainer.Units = 'normalized';
            self.HgJavaContainer.Position = [0 0 1 1];
        end
        
        function createTreeCustomizations(self)
            self.SelectionType = 'single';
            
            callbacks = handle(self.JavaTree,'CallbackProperties');
            callbacks.MouseClickedCallback = @self.onMouseClick;
            callbacks.MousePressedCallback = @self.onButtonDown;
            callbacks.MouseReleasedCallback = @self.onButtonUp;
            callbacks.TreeWillExpandCallback = @self.onExpand;
            callbacks.TreeCollapsedCallback = @self.onCollapse;
            callbacks.MouseMovedCallback = @self.onMouseMotion;
            callbacks.ValueChangedCallback = @self.onNodeSelection;
            
            tooltipManager = javaMethodEDT('sharedInstance','javax.swing.ToolTipManager');
            tooltipManager.registerComponent(self.JavaTree);
            
            % to compensate for font size changes
            self.JavaTree.setRowHeight(-1);
        end
        
        function areEnabled = areCallbacksEnabled(self)
            areEnabled = isvalid(self) && self.IsCallbackEnabled;
        end
        
        function node = getNodeFromMouseEvent(self, mouseEvent)
            x = mouseEvent.getX;
            y = mouseEvent.getY;
            
            treePath = self.JavaTree.getPathForLocation(x,y);
            if isempty(treePath)
                node  = [];
            else
                javaNode = treePath.getLastPathComponent();
                node = get(javaNode, 'TreeNode');
            end
            
        end
        
        function onExpand(self, ~, event)
            if self.areCallbacksEnabled() && ~isempty(self.NodeExpandedCallback)
                javaNode = event.getPath().getLastPathComponent();
                currentNode = get(javaNode, 'TreeNode');
                
                event = struct('Nodes', currentNode);
                hgfeval(self.NodeExpandedCallback, self, event);
            end
        end
        
        function onCollapse(self, ~, event)
            if self.areCallbacksEnabled() && ~isempty(self.NodeCollapsedCallback)
                javaNode = event.getPath().getLastPathComponent();
                currentNode = get(javaNode, 'TreeNode');
                
                event = struct('Nodes', currentNode);
                hgfeval(self.NodeCollapsedCallback,self,event);
            end
        end
        
        function onMouseClick(self, ~, event)
            if self.areCallbacksEnabled()
                node = self.getNodeFromMouseEvent(event);
                
                x = event.getX();
                y = event.getY();
                
                if event.isMetaDown() % is right click?
                    contextMenu = self.UIContextMenu;
                    
                    if ~isempty(node)
                        if ~any(self.SelectedNodes == node)
                            self.SelectedNodes = node;
                        end
                        
                        nodeContextMenus = [self.SelectedNodes.UIContextMenu];
                        commonContextMenu = unique(nodeContextMenus);
                        
                        isCommon = ~isempty(nodeContextMenus) ...
                            && numel(nodeContextMenus) == numel(self.SelectedNodes) ...
                            && all(nodeContextMenus(1) == nodeContextMenus);
                        
                        if isCommon
                            contextMenu = commonContextMenu;
                        end
                    end
                    
                    if ~isempty(contextMenu)
                        scrollPos = self.JavaScrollPane.getVerticalScrollBar().getValue();
                        
                        position = getpixelposition(self.HgJavaContainer,true);
                        position = [x + position(1), position(2) + position(4) - y + scrollPos];
                        
                        set(contextMenu, 'Position', position, 'Visible', 'on');
                    end
                elseif ~isempty(self.MouseClickedCallback)
                    event = struct('Position', [x,y], 'Nodes', node);
                    hgfeval(self.MouseClickedCallback, self, event);
                end
            end
        end
        
        function onButtonDown(self, ~, event)
            if self.areCallbacksEnabled() && ~isempty(self.ButtonDownFcn)
                x = event.getX;
                y = event.getY;
                
                node = self.getNodeFromMouseEvent(event);
                
                event = struct('Position', [x,y], 'Nodes', node);
                hgfeval(self.ButtonDownFcn, self, event);
            end
        end
        
        function onButtonUp(self, ~, event)
            if self.areCallbacksEnabled() && ~isempty(self.ButtonUpFcn)
                x = event.getX;
                y = event.getY;
                
                node = self.getNodeFromMouseEvent(event);
                
                event = struct('Position', [x,y], 'Nodes', node);
                hgfeval(self.ButtonUpFcn, self, event);
            end
        end
        
        function onMouseMotion(self, ~, event)
            if self.areCallbacksEnabled() && ~isempty(self.MouseMotionFcn)
                x = event.getX;
                y = event.getY;
                
                node = self.getNodeFromMouseEvent(event);
                
                event = struct('Position', [x,y], 'Nodes', node);
                hgfeval(self.MouseMotionFcn, self, event);
            end
        end
        
        function onNodeSelection(self, ~, event)
            if self.areCallbacksEnabled() && ~isempty(self.SelectionChangeFcn)
                paths = event.getPaths();
                
                addedNodes = [];
                removedNodes = [];
                
                for index = 1:numel(paths)
                    javaNode = paths(index).getLastPathComponent();
                    node = get(javaNode, 'TreeNode');
                    
                    if isvalid(node)
                        if event.isAddedPath(index - 1); %zero-based index
                            addedNodes = [addedNodes, node]; %#ok<AGROW>
                        else
                            removedNodes = [removedNodes, node]; %#ok<AGROW>
                        end
                    end
                end
                
                event = struct(...
                    'Nodes', self.SelectedNodes,...
                    'AddedNodes', addedNodes,...
                    'RemovedNodes', removedNodes);
                hgfeval(self.SelectionChangeFcn, self, event);
            end
        end
        
        function executeWithoutCallbacks(self, wrappedFunction)
            if self.IsCallbackEnabled
                didDisable = true;
                self.disableCallbacks();
            else
                didDisable = false;
            end
            
            wrappedFunction();
            
            if didDisable
                self.enableCallbacks();
            end
        end
    end
end

