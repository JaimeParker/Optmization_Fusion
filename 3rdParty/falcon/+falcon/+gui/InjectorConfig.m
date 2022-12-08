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
        % falcon.gui.InjectorConfig.context is a property.
        context
        % falcon.gui.InjectorConfig.intent is a property.
        intent
        % falcon.gui.InjectorConfig.layoutInflater is a property.
        layoutInflater
        % falcon.gui.InjectorConfig.stringUtil is a property.
        stringUtil
    end

    methods
        function args = windowArgs(context, intent, layoutInflater, layoutFileName)
        % falcon.gui.InjectorConfig.windowArgs is a function.
        %   args = falcon.gui.InjectorConfig.windowArgs(context, intent, layoutInflater, layoutFileName)
        end

        function provider = viewProvider(injector)
        % falcon.gui.InjectorConfig.viewProvider is a function.
        %   provider = falcon.gui.InjectorConfig.viewProvider(injector)
        end

        function obj = InjectorConfig()
        % Maps package dependencies.
        end

    end

end