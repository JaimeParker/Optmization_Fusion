classdef (Abstract) HasSensitive < falcon.core.Handle & falcon.core.HasProblem
    % Mixin that adds an isSensitive property.

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
        % Whether this value is uncertain or not.
        isSensitive
    end

    methods
        function obj = setSensitive(obj, sensitive)
        % Sets the isSensitive property of this object. Sensitive objects will
        % be analysed by a Fiacco sensitivity analysis.
        %  
        % <Syntax>
        % obj.setSensitive(Sensitive)
        %  
        % <Description>
        % Sets if this object is sensitive or not.
        %  
        % <Inputs>
        % > Sensitive: A scalar boolean specifying if the object is sensitive or not. Sensitive objects will
        % be subject to a sensitivity analysis via a Fiacco update.
        %  
        % <Keywords>
        % Flags!Sensitive
        end

        function obj = HasSensitive()
        % Mixin that adds an isSensitive property.
        end

    end

end