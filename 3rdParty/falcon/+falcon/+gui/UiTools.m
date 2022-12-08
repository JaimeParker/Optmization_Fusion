classdef UiTools < falcon.core.Handle
    % Proxy for UI functions - can be replaced for testing.
    %  
    % <Description>
    % Useful for testing, as it can be replaced with a dummy implementation
    % that fakes creating windows or buttons. This implementation simply
    % redirects all calls to existing functions.
    %  
    % Note: this only works when written like "uiTools.figure()", not like
    % "figure(uiTools)", as the implementation is based on subsref and uses
    % the dot (.) as an indicator.
    %  
    % <Syntax>
    % uiTools.figure()
    % uiTools.legend({'A', 'B', 'C'})
    % ...

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
        function isShift = isShiftPressed(~)
        % Determines if the shift button is pressed when selecting
        % elements in the current figure. Returns a scalar logical.
        end

        function varargout = subsref(self, S)
        % Fakes method calls on this instance, redirects all input to
        % system functions, if no such function exists on this class.
        %  
        % <Syntax>
        % [val1, val2, ...] = uiTools.mySystemFunction(arg1, arg2, ...)
        end

        function obj = UiTools()
        % Proxy for UI functions - can be replaced for testing.
        %  
        % <Description>
        % Useful for testing, as it can be replaced with a dummy implementation
        % that fakes creating windows or buttons. This implementation simply
        % redirects all calls to existing functions.
        %  
        % Note: this only works when written like "uiTools.figure()", not like
        % "figure(uiTools)", as the implementation is based on subsref and uses
        % the dot (.) as an indicator.
        %  
        % <Syntax>
        % uiTools.figure()
        % uiTools.legend({'A', 'B', 'C'})
        % ...
        end

    end

end