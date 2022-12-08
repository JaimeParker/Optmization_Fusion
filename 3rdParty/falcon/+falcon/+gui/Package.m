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
        % falcon.gui.Package.context is a property.
        context
        % falcon.gui.Package.intent is a property.
        intent
        % falcon.gui.Package.layoutInflater is a property.
        layoutInflater
        % falcon.gui.Package.stringUtil is a property.
        stringUtil
    end

    methods
        function args = windowArgs(context, intent, layoutInflater, layoutFileName)
        % falcon.gui.Package.windowArgs is a function.
        %   args = falcon.gui.Package.windowArgs(context, intent, layoutInflater, layoutFileName)
        end

        function provider = viewProvider(injector)
        % falcon.gui.Package.viewProvider is a function.
        %   provider = falcon.gui.Package.viewProvider(injector)
        end

        function obj = Package()
        % Maps package dependencies.
        end

    end

end