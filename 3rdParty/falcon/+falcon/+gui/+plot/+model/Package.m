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
        % falcon.gui.plot.model.Package.commandHistory is a property.
        commandHistory
        % falcon.gui.plot.model.Package.fileReaderProvider is a property.
        fileReaderProvider
        % falcon.gui.plot.model.Package.fileWriterProvider is a property.
        fileWriterProvider
        % falcon.gui.plot.model.Package.gridTypes is a property.
        gridTypes
        % falcon.gui.plot.model.Package.problemAdapter is a property.
        problemAdapter
        % falcon.gui.plot.model.Package.rootConfig is a property.
        rootConfig
        % falcon.gui.plot.model.Package.plotConfig is a property.
        plotConfig
        % falcon.gui.plot.model.Package.lineConfig is a property.
        lineConfig
        % falcon.gui.plot.model.Package.stringUtil is a property.
        stringUtil
        % falcon.gui.plot.model.Package.valueProvider is a property.
        valueProvider
    end

    methods
        function provider = lineConfigProvider(scope)
        % falcon.gui.plot.model.Package.lineConfigProvider is a function.
        %   provider = falcon.gui.plot.model.Package.lineConfigProvider(scope)
        end

        function provider = plotConfigProvider(scope)
        % falcon.gui.plot.model.Package.plotConfigProvider is a function.
        %   provider = falcon.gui.plot.model.Package.plotConfigProvider(scope)
        end

        function obj = Package()
        % Maps package dependencies.
        end

    end

end