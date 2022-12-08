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
        % falcon.gui.plot.view.InjectorConfig.commandHistory is a property.
        commandHistory
        % falcon.gui.plot.view.InjectorConfig.layoutFileName is a property.
        layoutFileName
        % falcon.gui.plot.view.InjectorConfig.layoutInflater is a property.
        layoutInflater
        % falcon.gui.plot.view.InjectorConfig.lineFormatEditorLayout is a property.
        lineFormatEditorLayout
        % falcon.gui.plot.view.InjectorConfig.mainViewModel is a property.
        mainViewModel
        % falcon.gui.plot.view.InjectorConfig.menuBuilder is a property.
        menuBuilder
        % falcon.gui.plot.view.InjectorConfig.plotViewModel is a property.
        plotViewModel
        % falcon.gui.plot.view.InjectorConfig.plotFormatEditorLayout is a property.
        plotFormatEditorLayout
        % falcon.gui.plot.view.InjectorConfig.plotGridViewModel is a property.
        plotGridViewModel
        % falcon.gui.plot.view.InjectorConfig.plotValueEditorViewModel is a property.
        plotValueEditorViewModel
        % falcon.gui.plot.view.InjectorConfig.plotValueEditorLayout is a property.
        plotValueEditorLayout
        % falcon.gui.plot.view.InjectorConfig.problemAdapter is a property.
        problemAdapter
        % falcon.gui.plot.view.InjectorConfig.uiTools is a property.
        uiTools
        % falcon.gui.plot.view.InjectorConfig.valueProvider is a property.
        valueProvider
        % falcon.gui.plot.view.InjectorConfig.valueTreeBuilder is a property.
        valueTreeBuilder
    end

    methods
        function args = windowArgs(injector, scope, layoutFileName)
        % falcon.gui.plot.view.InjectorConfig.windowArgs is a function.
        %   args = falcon.gui.plot.view.InjectorConfig.windowArgs(injector, scope, layoutFileName)
        end

        function args = varargin(parent)
        % VARARGIN Variable length input argument list.
        %   Allows any number of arguments to a function.  The variable
        %   VARARGIN is a cell array containing the optional arguments to the
        %   function.  VARARGIN must be declared as the last input argument
        %   and collects all the inputs from that point onwards. In the
        %   declaration, VARARGIN must be lowercase (i.e., varargin).
        %  
        %   For example, the function,
        %  
        %       function myplot(x,varargin)
        %       plot(x,varargin{:})
        %  
        %   collects all the inputs starting with the second input into the 
        %   variable "varargin".  MYPLOT uses the comma-separated list syntax
        %   varargin{:} to pass the optional parameters to plot.  The call,
        %  
        %       myplot(sin(0:.1:1),'color',[.5 .7 .3],'linestyle',':')
        %  
        %   results in varargin being a 1-by-4 cell array containing the
        %   values 'color', [.5 .7 .3], 'linestyle', and ':'.
        end

        function provider = plotProvider(scope, problem, rootConfig)
        % falcon.gui.plot.view.InjectorConfig.plotProvider is a function.
        %   provider = falcon.gui.plot.view.InjectorConfig.plotProvider(scope, problem, rootConfig)
        end

        function lineHandle = lineHandle(plotAxes)
        % falcon.gui.plot.view.InjectorConfig.lineHandle is a function.
        %   lineHandle = falcon.gui.plot.view.InjectorConfig.lineHandle(plotAxes)
        end

        function plotAxes = plotAxes(parent)
        % falcon.gui.plot.view.InjectorConfig.plotAxes is a function.
        %   plotAxes = falcon.gui.plot.view.InjectorConfig.plotAxes(parent)
        end

        function provider = nodeProvider()
        % falcon.gui.plot.view.InjectorConfig.nodeProvider is a function.
        %   provider = falcon.gui.plot.view.InjectorConfig.nodeProvider
        end

        function provider = lineProvider(scope, problem, plotConfig, plotAxes)
        % falcon.gui.plot.view.InjectorConfig.lineProvider is a function.
        %   provider = falcon.gui.plot.view.InjectorConfig.lineProvider(scope, problem, plotConfig, plotAxes)
        end

        function obj = InjectorConfig()
        % Maps package dependencies.
        end

    end

end