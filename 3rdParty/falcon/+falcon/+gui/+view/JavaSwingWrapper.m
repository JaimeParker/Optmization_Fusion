classdef (Abstract) JavaSwingWrapper < falcon.gui.view.Container
    % Wraps a javax.swing component to include in a Matlab figure.

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
        % 1x1 function_handle - called when the selected color changes
        Callback
        % 'on'|'off'
        Enable
        % 1xn char - to be compatible with other uicontrol elements
        Style
        % any - exposed java form control value
        Value
    end

    methods
        function self = JavaSwingWrapper(varargin)
        % Wraps a javax.swing component to include in a Matlab figure.
        end

        function onJavaEvent(self, ~, ~)
        % falcon.gui.view.JavaSwingWrapper/onJavaEvent is a function.
        %   onJavaEvent(self, ~, ~)
        end

        function lhs1 = loadobj(rhs1, rhs2)
        % CustomizedLoadObj
        end

    end

end