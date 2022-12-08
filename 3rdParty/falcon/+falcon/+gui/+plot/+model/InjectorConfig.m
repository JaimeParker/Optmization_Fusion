classdef (Abstract) InjectorConfig
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
        % falcon.gui.plot.model.InjectorConfig.commandHistory is a property.
        commandHistory
        % falcon.gui.plot.model.InjectorConfig.fileReaderProvider is a property.
        fileReaderProvider
        % falcon.gui.plot.model.InjectorConfig.fileWriterProvider is a property.
        fileWriterProvider
        % falcon.gui.plot.model.InjectorConfig.gridTypes is a property.
        gridTypes
        % falcon.gui.plot.model.InjectorConfig.problemAdapter is a property.
        problemAdapter
        % falcon.gui.plot.model.InjectorConfig.rootConfig is a property.
        rootConfig
        % falcon.gui.plot.model.InjectorConfig.plotConfig is a property.
        plotConfig
        % falcon.gui.plot.model.InjectorConfig.lineConfig is a property.
        lineConfig
        % falcon.gui.plot.model.InjectorConfig.stringUtil is a property.
        stringUtil
        % falcon.gui.plot.model.InjectorConfig.valueProvider is a property.
        valueProvider
    end

    methods
        function provider = lineConfigProvider(scope)
        % falcon.gui.plot.model.InjectorConfig.lineConfigProvider is a function.
        %   provider = falcon.gui.plot.model.InjectorConfig.lineConfigProvider(scope)
        end

        function provider = plotConfigProvider(scope)
        % falcon.gui.plot.model.InjectorConfig.plotConfigProvider is a function.
        %   provider = falcon.gui.plot.model.InjectorConfig.plotConfigProvider(scope)
        end

        function obj = InjectorConfig()
        % Maps package dependencies.
        end

    end

end