classdef (Abstract) HasActive < falcon.core.Handle & falcon.core.HasProblem
    % Mixin that adds an isActive property.

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
        % Whether this value is active or not.
        isActive
    end

    methods
        function setActive(obj, active)
        % Sets the isActive property of this object.
        %  
        % <Syntax>
        % obj.setActive(isActive)
        %  
        % <Description>
        % Set whether this object is active. In case the object is not
        % active it will be ignored during optimization.
        %  
        % <Inputs>
        % isActive: Boolean to check if this object is active or not.
        %  
        % <Keywords>
        % Flags!Active
        end

        function obj = HasActive()
        % Mixin that adds an isActive property.
        end

    end

end