classdef PlotGrid < falcon.gui.view.Container & SimpleListener
    % Manages a layout grid of falcon.gui.plot.view.Plot controllers.

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
        % 1xn double
        SelectedPlotIndices
        % 1x1 falcon.gui.plot.config.Plot | [] - empty, if nothing selected
        SelectedPlotConfig
        % 1x1 falcon.gui.plot.config.Line | [] - empty, if nothing selected
        SelectedLineConfig
    end

    methods
        function self = PlotGrid(plotGridViewModel, plotProvider, rootConfig, uiTools, varargin)
        % Manages a layout grid of falcon.gui.plot.view.Plot controllers.
        end

        function exportSelected(self)
        % Exports all selected plots to separate figures.
        end

        function swapSelected(self)
        % Swaps the positions of two selected plots.
        end

        function mergeSelected(self)
        % Merges two selected plots and then selects the result.
        end

        function resetSelected(self)
        % Empties the selected plot.
        end

        function setLayoutRowsColumns(self, rows, columns)
        % Resets all positions, adds missing and keeps existing plots.
        end

        function resetLayout(self)
        % Resets all plot positions, but keeps existing plots.
        end

        function onKeyChange(self, ~, ~)
        % Called when any rootConfig.Plots.KeyIdentifier changes.
        end

        function onLineClick(self, plotIndex, lineIndex)
        % Called when a line is clicked.
        end

        function onPlotClick(self, nowSelected)
        % Called when the user clicks on a plot. Holding the shift key
        % selects multiple plots.
        end

        function onPlotsChange(self, ~, ~)
        % Called when plots are replaced / added / removed.
        end

        function lhs1 = loadobj(rhs1, rhs2)
        % CustomizedLoadObj
        end

    end

end