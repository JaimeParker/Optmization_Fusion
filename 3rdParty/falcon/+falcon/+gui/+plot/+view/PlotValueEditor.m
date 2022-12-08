classdef PlotValueEditor < uiextras.VBox & SimpleListener
    % Lets the user select falcon.Problem grid values to plot.

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
        % 1x1 uicontrol
        KeyPopup
        % 1x1 uiextras.jTree.CheckboxTree
        ValueTree
    end

    methods
        function self = PlotValueEditor(layoutInflater, valueTreeBuilder, plotValueEditorLayout, plotValueEditorViewModel, varargin)
        % Lets the user select falcon.Problem grid values to plot.
        end

        function onKeySelected(self, ~, ~)
        % Called when the USER selects a new KeyIdentifier.
        end

        function onValueSelected(self, ~)
        % Calles when the USER selects a grid value in the tree view.
        end

        function onConfigChange(self, ~, ~)
        % Called when the currently selected plot config is updated
        % remotely (by the view model, by the user, ...). Updates the
        % form fields.
        end

        function onPlotSelected(self, plotConfig)
        % Called when none/one/more plots are selected.
        end

        function lhs1 = loadobj(rhs1, rhs2)
        % CustomizedLoadObj
        end

    end

end