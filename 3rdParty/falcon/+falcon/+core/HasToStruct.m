classdef (Abstract) HasToStruct < falcon.core.Handle
    % Mixin that adds debugging tools.

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
        function strc = ToStruct(obj)
        % falcon.core.HasToStruct/ToStruct is a function.
        %   obj = falcon.core.HasToStruct
        end

        function obj = HasToStruct()
        % Mixin that adds debugging tools.
        end

    end

end