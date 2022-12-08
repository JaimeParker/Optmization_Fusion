classdef PlotGridViewModel < falcon.core.Handle
    % Toolbox for non-UI related tasks for the plot grid view.

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
    end

    methods
        function self = PlotGridViewModel(rootConfig, commandHistory, plotConfigProvider)
        % Toolbox for non-UI related tasks for the plot grid view.
        end

        function indices = plotIndicesGroupedByKey(self)
        % Computes plot groups with the same x axis identfier.
        end

        function resetAtIndex(self, index)
        % Clears the selected plot at the given index.
        end

        function resetAll(self)
        % Clears all plots, resets the plot positions.
        end

        function setRowsAndColumns(self, rows, columns)
        % Updates the grid layout size, adds plots where necessary.
        end

        function mergeSelected(self, indices)
        % Merges position, lines and format of two plots.
        end

        function swapSelected(self, indices)
        % Swaps the positions of two plots.
        end

    end

end