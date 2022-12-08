classdef VariantSystemDefinition
    % Definition of a variant system that switches between functions based on
    % the discrete value of a variant control variable.

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
        % System name for log messages and code comments
        Name
        % Name of the variant control variable
        ControlVariable
        % System output argument names
        Outputs
        % VariantDefinition array
        Variants
    end

    methods
        function self = checkValid(self)
        % Do basic consistency checks, fail if invalid
        end

        function flag = isValid(self)
        % Do basic consistency checks
        end

        function outputs = getOutputs(self)
        % Get the system output argument names
        end

        function inputs = getInputs(self)
        % Get a list of input variables required for all variants.
        %  
        % <Outputs>
        % > inputs: cell array of input variable names
        end

        function self = VariantSystemDefinition(name, controlVariable, variants, outputs)
        % Define a variant system.
        %  
        % <Syntax>
        % varSys = VariantSystemDefinition(name, controlVariable, variants, outputs)
        %  
        % <Inputs>
        % > name: system name (char)
        % > controlVariable: name of the variable that selects a variant at
        %   runtime
        % > variants: falcon.core.builder.VariantDefinition array
        % > outputs: cell array of output names
        end

    end

end