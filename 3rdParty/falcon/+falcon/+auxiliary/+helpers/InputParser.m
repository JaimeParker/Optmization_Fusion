classdef InputParser < inputParser
    % Wrapper for inputParser, translates standard Matlab exception identifiers
    % to FALCON.m error codes.

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
        function varargout = parse(self, varargin)
        % parse(PARSEOBJ,ARGLIST) parses user inputs based on the input scheme.
        %   PARSE matches arguments in the comma separated list ARGLIST with
        %   input scheme defined by PARSEOBJ.  The inputParser properties Results,
        %   UsingDefaults, and Unmatched are set by calling the PARSE methods.  If
        %   the parse fails for any reason, the PARSE method throws an error.
        end

        function obj = InputParser()
        % Wrapper for inputParser, translates standard Matlab exception identifiers
        % to FALCON.m error codes.
        end

    end

end