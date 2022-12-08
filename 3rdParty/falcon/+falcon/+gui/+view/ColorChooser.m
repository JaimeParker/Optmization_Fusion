classdef ColorChooser < falcon.gui.view.JavaSwingWrapper
    % Is a button that pops up a color selection dialog.
    %  
    % <Syntax>
    % parent = figure()
    % spinner = falcon.gui.view.ColorChooser('Parent', parent)
    %  
    % <Layout XML>
    % <falcon.gui.view.ColorChooser Value="[0,0,1]" Enable="on" />

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
        % 1x3 double - RGB color with each components element [0, 1]
        Value
        % 1x1 function_handle - called when the selected color changes
        Callback
        % 'on'|'off'
        Enable
        % 1xn char - to be compatible with other uicontrol elements
        Style
    end

    methods
        function self = ColorChooser(varargin)
        % Is a button that pops up a color selection dialog.
        %  
        % <Syntax>
        % parent = figure()
        % spinner = falcon.gui.view.ColorChooser('Parent', parent)
        %  
        % <Layout XML>
        % <falcon.gui.view.ColorChooser Value="[0,0,1]" Enable="on" />
        end

        function lhs1 = loadobj(rhs1, rhs2)
        % CustomizedLoadObj
        end

        function onJavaEvent(self, ~, ~)
        % falcon.gui.view.JavaSwingWrapper/onJavaEvent is a function.
        %   onJavaEvent(self, ~, ~)
        end

    end

end