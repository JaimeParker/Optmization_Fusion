classdef Line < falcon.core.Handle
    % Configuration handle for lines, properties are observable.

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
        % 1xn char - type_name of the plotted grid value
        Identifier
        % 1xn double - array of phase indices to plot
        PhaseIndices
        % 1x1 logical - if true, the line will be discontinous between phases
        JoinPhases
        % 1x1 logical - if true, markers will be drawn at phase start only
        MarkPhaseStartOnly
        % 1x1 struct - more formatting options
        Format
        % falcon.gui.plot.config.Line.LINE_STYLES is a property.
        LINE_STYLES
        % falcon.gui.plot.config.Line.MARKER_STYLES is a property.
        MARKER_STYLES
    end

    methods
        function obj = Line()
        % Configuration handle for lines, properties are observable.
        end

    end

end