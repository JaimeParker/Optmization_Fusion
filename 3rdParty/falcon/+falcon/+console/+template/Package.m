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
    end

    methods
        function provider = templateWriterProvider(scope)
        % falcon.console.template.Package.templateWriterProvider is a function.
        %   provider = falcon.console.template.Package.templateWriterProvider(scope)
        end

        function provider = templateProvider(injector, scope)
        % falcon.console.template.Package.templateProvider is a function.
        %   provider = falcon.console.template.Package.templateProvider(injector, scope)
        end

        function template = template(folder, templateName)
        % falcon.console.template.Package.template is a function.
        %   template = falcon.console.template.Package.template(folder, templateName)
        end

        function obj = Package()
        % Maps package dependencies.
        end

    end

end