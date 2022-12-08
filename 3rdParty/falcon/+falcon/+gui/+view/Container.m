classdef (Abstract) Container < uix.Container & uix.mixin.Container
    % Interface to uix.Container that accepts 'Parent' constructor varargin.

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
        function self = Container(varargin)
        % Interface to uix.Container that accepts 'Parent' constructor varargin.
        end

        function lhs1 = loadobj(rhs1, rhs2)
        % CustomizedLoadObj
        end

    end

end