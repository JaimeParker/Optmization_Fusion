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
    end

    methods
        function file = plotFormatEditor(folder)
        % falcon.gui.plot.layout.InjectorConfig.plotFormatEditor is a function.
        %   file = falcon.gui.plot.layout.InjectorConfig.plotFormatEditor(folder)
        end

        function file = main(folder)
        % falcon.gui.plot.layout.InjectorConfig.main is a function.
        %   file = falcon.gui.plot.layout.InjectorConfig.main(folder)
        end

        function file = lineFormatEditor(folder)
        % falcon.gui.plot.layout.InjectorConfig.lineFormatEditor is a function.
        %   file = falcon.gui.plot.layout.InjectorConfig.lineFormatEditor(folder)
        end

        function file = plotValueEditor(folder)
        % falcon.gui.plot.layout.InjectorConfig.plotValueEditor is a function.
        %   file = falcon.gui.plot.layout.InjectorConfig.plotValueEditor(folder)
        end

        function obj = InjectorConfig()
        % Maps package dependencies.
        end

    end

end