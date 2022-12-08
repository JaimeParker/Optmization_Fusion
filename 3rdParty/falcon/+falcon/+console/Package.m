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
        % falcon.console.Package.templateWriterProvider is a property.
        templateWriterProvider
        % falcon.console.Package.preferences is a property.
        preferences
    end

    methods
        function folder = testFolder()
        % falcon.console.Package.testFolder is a function.
        %   folder = falcon.console.Package.testFolder
        end

        function provider = objectProvider(injector)
        % falcon.console.Package.objectProvider is a function.
        %   provider = falcon.console.Package.objectProvider(injector)
        end

        function provider = handlerProvider(injector, scope)
        % falcon.console.Package.handlerProvider is a function.
        %   provider = falcon.console.Package.handlerProvider(injector, scope)
        end

        function list = handlerClasses(scope)
        % this package contains all the console handlers
        end

        function handler = Command(scope, command, injector)
        % falcon.console.Package.Command is a function.
        %   handler = falcon.console.Package.Command(scope, command, injector)
        end

        function obj = Package()
        % Maps package dependencies.
        end

    end

end