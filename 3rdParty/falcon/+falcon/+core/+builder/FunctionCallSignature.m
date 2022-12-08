classdef FunctionCallSignature
    % Function call signature for VariantDefinition

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
        % The function handle
        FunctionHandle
        % Cell array of input arguments (variable names or numeric constants)
        Inputs
        % Cell array of output argument names
        Outputs
    end

    methods
        function self = checkValid(self)
        % Do basic consistency checks, fail if invalid
        end

        function flag = isValid(self)
        % Do basic consistency checks
        end

        function self = FunctionCallSignature(functionHandle, inputs, outputs)
        % Define a function call.
        %  
        % <Syntax>
        % signature = FunctionCallSignature(functionHandle, inputs, outputs)
        %  
        % <Description>
        % The FunctionCallSignature stores a function handle along with its
        % input and output arguments.
        %  
        % <Inputs>
        % > functionHandle: a function_handle object
        % > inputs: a cell of input arguments, which can be variable names
        %   (char) or numeric constants; for example, inputs = {'x', 'y',
        %   pi}.
        % > outputs: a cell array of output argument names (char)
        end

    end

end