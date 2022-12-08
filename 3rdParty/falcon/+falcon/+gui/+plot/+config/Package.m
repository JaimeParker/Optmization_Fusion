classdef (Abstract) Package
    % Maps package dependencies.

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
        % falcon.gui.plot.config.Package.plotConfig is a property.
        plotConfig
    end

    methods
        function defaultColors = defaultColors()
        % falcon.gui.plot.config.Package.defaultColors is a function.
        %   defaultColors = falcon.gui.plot.config.Package.defaultColors
        end

        function gridType = GridType(scope, charValue)
        % falcon.gui.plot.config.Package.GridType is a function.
        %   gridType = falcon.gui.plot.config.Package.GridType(scope, charValue)
        end

        function gridTypes = gridTypes(scope)
        % falcon.gui.plot.config.Package.gridTypes is a function.
        %   gridTypes = falcon.gui.plot.config.Package.gridTypes(scope)
        end

        function obj = Package()
        % Maps package dependencies.
        end

    end

end