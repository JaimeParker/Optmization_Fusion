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
        % falcon.gui.plot.config.cmd.Package.builder is a property.
        builder
    end

    methods
        function provider = compositeCommandProvider()
        % falcon.gui.plot.config.cmd.Package.compositeCommandProvider is a function.
        %   provider = falcon.gui.plot.config.cmd.Package.compositeCommandProvider
        end

        function provider = removeCommandProvider()
        % falcon.gui.plot.config.cmd.Package.removeCommandProvider is a function.
        %   provider = falcon.gui.plot.config.cmd.Package.removeCommandProvider
        end

        function provider = insertCommandProvider()
        % falcon.gui.plot.config.cmd.Package.insertCommandProvider is a function.
        %   provider = falcon.gui.plot.config.cmd.Package.insertCommandProvider
        end

        function provider = updateCommandProvider()
        % falcon.gui.plot.config.cmd.Package.updateCommandProvider is a function.
        %   provider = falcon.gui.plot.config.cmd.Package.updateCommandProvider
        end

        function obj = Package()
        % Maps package dependencies.
        end

    end

end