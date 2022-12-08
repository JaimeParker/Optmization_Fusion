classdef Spinner < falcon.gui.view.JavaSwingWrapper
    % Displays a Java number input field with arrow buttons.
    %  
    % <Syntax>
    % parent = figure()
    % spinner = falcon.gui.view.Spinner('Parent', parent)
    %  
    % <Layout XML>
    % <falcon.gui.view.Spinner Minimum="0.5" Maximum="Inf" StepSize="0.5"
    %                          Value="0.5" Enable="on" />

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
        % 1x1 double
        Value
        % 1x1 double
        Minimum
        % 1x1 double
        Maximum
        % 1x1 double
        StepSize
        % 1x1 function_handle - called when the selected color changes
        Callback
        % 'on'|'off'
        Enable
        % 1xn char - to be compatible with other uicontrol elements
        Style
    end

    methods
        function self = Spinner(varargin)
        % Displays a Java number input field with arrow buttons.
        %  
        % <Syntax>
        % parent = figure()
        % spinner = falcon.gui.view.Spinner('Parent', parent)
        %  
        % <Layout XML>
        % <falcon.gui.view.Spinner Minimum="0.5" Maximum="Inf" StepSize="0.5"
        %                          Value="0.5" Enable="on" />
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