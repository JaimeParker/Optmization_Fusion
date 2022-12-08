classdef Plot < falcon.core.Handle
    % Configuration handle for plots, properties are observable.

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
        % 1xn char - type_name for the x axis value. uses time, if empty.
        KeyIdentifier
        % {1x1 falcon.gui.plot.config.Line} - lines to be plotted
        Lines
        % 1x1 struct - position in the grid layout
        Position
        % 1x1 struct - more format options
        Format
        % falcon.gui.plot.config.Plot.INTERPRETERS is a property.
        INTERPRETERS
        % falcon.gui.plot.config.Plot.LEGEND_POSITIONS is a property.
        LEGEND_POSITIONS
    end

    methods
        function obj = Plot()
        % Configuration handle for plots, properties are observable.
        end

    end

end