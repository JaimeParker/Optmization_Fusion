classdef (Abstract) HasFixed < falcon.core.Handle & falcon.core.HasProblem
    % Mixin that adds an isFixed property.

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
        % Whether this value is fixed or not.
        isFixed
    end

    methods
        function obj = setFixed(obj, fixed)
        % Sets the isFixed property of this object. Fixed objects will
        % not be optimized.
        %  
        % <Syntax>
        % obj.setFixed(fixed)
        %  
        % <Description>
        % Sets if this object can be optimized or not.
        %  
        % <Inputs>
        % > fixed: A scalar boolean specifying if the object is fixed or not. Fixed
        % objects are not subject to optimization.
        %  
        % <Keywords>
        % Flags!Fixed
        end

        function obj = HasFixed()
        % Mixin that adds an isFixed property.
        end

    end

end