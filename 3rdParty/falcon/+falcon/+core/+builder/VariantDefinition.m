classdef VariantDefinition
    % Definition of a single variant in a variant system

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
        % Value of the control variable that activates the variant
        ControlValue
        % The variant function call
        Signature
        % Hash mode for derivative generation
        HashMode
        % Optimize derivative code
        OptimizeCode
    end

    methods
        function self = checkValid(self)
        % Do basic consistency checks, fail if invalid
        end

        function flag = isValid(self)
        % Do basic consistency checks
        end

        function self = VariantDefinition(controlValue, signature)
        % Define a variant of a variant system.
        %  
        % <Syntax>
        % variant = VariantDefinition(controlValue, signature)
        %  
        % <Description>
        % The variant is defined by a control value for variant selection
        % and a function call signature.
        %  
        % <Inputs>
        % controlValue: a numeric constant or (coder compatible)
        %               enumeration value
        % signature: a falcon.core.builder.FunctionCallSignature instance
        end

    end

end