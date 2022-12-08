classdef PlotFormatEditor < uiextras.VBox & falcon.gui.view.FormFields & SimpleListener
    % This form edits a falcon.gui.plot.config.Plot object.

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
        function self = PlotFormatEditor(layoutInflater, plotFormatEditorLayout, commandHistory, varargin)
        % This form edits a falcon.gui.plot.config.Plot object.
        end

        function onPlotSelected(self, plotConfig)
        % Called when one/none/multiple plots are selected in the UI.
        end

        function lhs1 = loadobj(rhs1, rhs2)
        % CustomizedLoadObj
        end

    end

end