classdef Root < falcon.core.Handle
    % Configuration handle for the whole layout, properties are
    % observable.

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
        % mx3 double - default RGB line colors, all element [0, 1]
        DefaultColors
        % {1x1 falcon.gui.plot.config.Plot}
        Plots
    end

    methods
        function self = Root(plotConfig, defaultColors)
        % Configuration handle for the whole layout, properties are
        % observable.
        end

    end

end