classdef ValueTreeBuilder < falcon.core.Handle
    % Creates all tree nodes for the grid value selection tree.

    % -------------------------------------------------------------------------
    %                                FALCON.m
    % Copyright (c) 2014-2019 Institute of Flight System Dynamics, TUM, Munich
    % Matthias Bittner, Matthias Rieck, Maximilian Richter,
    % Benedikt Grueter, Johannes Diepolder, Florian Schwaiger,
    % Patrick Piprek, and Florian Holzapfel
    % Downloading, using, copying, or modifying FALCON.m code constitutes an
    % agreement to ALL of the terms of the FALCON.m EULA.
    % -------------------------------------------------------------------------

    properties
        % 1xn uiextras.jTree.CheckboxTreeNode
        Nodes
    end

    methods
        function buildOnTree(self, tree)
        % Build the tree nodes for the given UI tree element.
        end

        function self = ValueTreeBuilder(problemAdapter, nodeProvider)
        % Creates all tree nodes for the grid value selection tree.
        end

    end

end