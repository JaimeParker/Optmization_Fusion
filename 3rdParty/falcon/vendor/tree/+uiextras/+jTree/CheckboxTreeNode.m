classdef CheckboxTreeNode < uiextras.jTree.TreeNode
    % CheckboxTreeNode - Defines a node for a checkbox tree control
    %   The CheckboxTreeNode object defines a checkbox tree node to be
    %   placed on a uiextras.jTree.CheckboxTree control.
    %
    % Syntax:
    %   node = uiextras.jTree.CheckboxTreeNode
    %   node = uiextras.jTree.CheckboxTreeNode('Property','Value',...)
    %
    %   The CheckboxTree contains all properties and methods of the
    %   <a href="matlab:doc uiextras.jTree.TreeNode">uiextras.jTree.TreeNode</a>, plus the following:
    %
    % CheckboxTreeNode Properties:
    %
    %   CheckboxEnabled - Indicates whether the checkbox on this node may
    %   be selected with the mouse
    %
    %   CheckboxVisible - Indicates whether the checkbox on this node is
    %   visible
    %
    %   Checked - Indicates whether the checkbox on this node is checked
    %
    %   PartiallyChecked - Indicates whether the checkbox on this node is
    %   partially checked, in the case where some child nodes are checked
    %   under DigIn mode(read-only)
    %
    % Notes:
    %   - The CheckboxTreeNode may be also used on a uiextras.jTree.Tree
    %   control, but the checkboxes will not be visible. This may be useful
    %   if you are mixing regular trees with checkbox trees, and want to
    %   use a uniform type of TreeNode or need to be able to drag and drop
    %   from one tree to another.
    %
    % See also: uiextras.jTree.Tree, uiextras.jTree.CheckboxTree,
    %           uiextras.jTree.TreeNode,
    
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
    
    properties (Dependent=true)
        CheckboxEnabled
        CheckboxVisible
        Checked
    end
    
    properties (Dependent = true, SetAccess = immutable)
        PartiallyChecked
    end
    
    methods
        function self = CheckboxTreeNode(varargin)
            self = self@uiextras.jTree.TreeNode(varargin{:});
        end
        
        function copiedNodes = copy(nodes, newParent)
            copiedNodes = copy@uiextras.jTree.TreeNode(nodes, newParent);
            
            for index = 1:numel(nodes)
                copiedNodes(index).CheckboxEnabled = nodes(index).CheckboxEnabled;
                copiedNodes(index).CheckboxVisible = nodes(index).CheckboxVisible;
                copiedNodes(index).Checked = nodes(index).Checked;
            end
        end
        
        function enabled = get.CheckboxEnabled(self)
            enabled = self.JavaNode.CheckBoxEnabled;
        end
        
        function set.CheckboxEnabled(self, enabled)
            self.JavaNode.CheckBoxEnabled = enabled;
            self.Tree.nodeChanged(self)
        end
        
        function visible = get.CheckboxVisible(self)
            visible = self.JavaNode.CheckBoxVisible;
        end
        
        function set.CheckboxVisible(self, visible)
            self.JavaNode.CheckBoxVisible = visible;
            self.Tree.nodeChanged(self)
        end
        
        function checked = get.Checked(self)
            checked = self.Tree.isNodeChecked(self);
        end
        
        function set.Checked(self, checked)
            self.Tree.setChecked(self, checked);
        end
        
        function partiallyChecked = get.PartiallyChecked(self)
            partiallyChecked = self.Tree.isNodePartiallyChecked(self);
        end
    end
end
