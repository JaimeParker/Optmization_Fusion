classdef LineFormatEditor < uiextras.VBox & falcon.gui.view.FormFields & SimpleListener
    % This form edits a falcon.gui.plot.config.Line object.

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
        function self = LineFormatEditor(layoutInflater, lineFormatEditorLayout, commandHistory, varargin)
        % This form edits a falcon.gui.plot.config.Line object.
        end

        function onLineSelected(self, lineConfig)
        % Called when a line is selected in the UI.
        end

        function lhs1 = loadobj(rhs1, rhs2)
        % CustomizedLoadObj
        end

    end

end