classdef SimpleQuadraticPointFunction < falcon.lib.SimpleFunction
    % -------------------------------------------------------------------------
    %                                FALCON.m
    % Copyright (c) 2014-2019 Institute of Flight System Dynamics, TUM, Munich
    % Matthias Bittner, Matthias Rieck, Maximilian Richter,
    % Benedikt Grueter, Johannes Diepolder, Florian Schwaiger,
    % Patrick Piprek, and Florian Holzapfel
    % Downloading, using, copying, or modifying FALCON.m code constitutes an
    % agreement to ALL of the terms of the FALCON.m EULA.
    % -------------------------------------------------------------------------

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
        % falcon.lib.SimpleQuadraticPointFunction/NumSamples is a property.
        NumSamples
        % falcon.lib.SimpleQuadraticPointFunction/VariablePermutation is a property.
        VariablePermutation
        % falcon.lib.SimpleQuadraticPointFunction/WeightMatrix is a property.
        WeightMatrix
        % falcon.lib.SimpleQuadraticPointFunction/Offset is a property.
        Offset
        % falcon.lib.SimpleQuadraticPointFunction/StateOffset is a property.
        StateOffset
        % falcon.lib.SimpleQuadraticPointFunction/ControlOffset is a property.
        ControlOffset
        % falcon.lib.SimpleQuadraticPointFunction/ParameterOffset is a property.
        ParameterOffset
        % falcon.lib.SimpleQuadraticPointFunction/OutputOffset is a property.
        OutputOffset
        % falcon.lib.SimpleQuadraticPointFunction/UsePagemtimes is a property.
        UsePagemtimes
        % falcon.lib.SimpleFunction/NumVariables is a property.
        NumVariables
        % falcon.lib.SimpleFunction/Variables is a property.
        Variables
        % falcon.lib.SimpleFunction/StatesIndex is a property.
        StatesIndex
        % falcon.lib.SimpleFunction/ControlsIndex is a property.
        ControlsIndex
        % falcon.lib.SimpleFunction/ParametersIndex is a property.
        ParametersIndex
        % falcon.lib.SimpleFunction/OutputsIndex is a property.
        OutputsIndex
        % falcon.lib.SimpleFunction/States is a property.
        States
        % falcon.lib.SimpleFunction/Controls is a property.
        Controls
        % falcon.lib.SimpleFunction/Parameters is a property.
        Parameters
        % falcon.lib.SimpleFunction/Outputs is a property.
        Outputs
        % falcon.lib.SimpleFunction/NumStates is a property.
        NumStates
        % falcon.lib.SimpleFunction/NumControls is a property.
        NumControls
        % falcon.lib.SimpleFunction/NumParameters is a property.
        NumParameters
        % falcon.lib.SimpleFunction/NumOutputs is a property.
        NumOutputs
    end

    methods
        function info = describe(self)
        % FALCON.m model info.
        end

        function [val, jac, hess] = evaluate(self, varargin)
        % FALCON.m POINT_FUNCTION interface.
        end

        function self = setOffset(self, offset)
        % Set offset.
        %  
        % <Syntax>
        % f = f.setOffset(offset)
        %  
        % <Description>
        % Set the offset coefficients, preserving the number of samples.
        end

        function self = setWeightMatrix(self, weightMatrix)
        % Set weight matrix.
        %  
        % <Syntax>
        % f = f.setWeightMatrix(weightMatrix)
        %  
        % <Description>
        % Set the weight matrix, preserving the number of samples.
        end

        function self = setWeightMatrixAndOffset(self, weightMatrix, offset)
        % Set weight matrix and offset.
        %  
        % <Syntax>
        % f = f.setWeightMatrixAndOffset(weightMatrix, offset)
        %  
        % <Description>
        % Set the weight matrix and offset coefficients.
        end

        function self = SimpleQuadraticPointFunction(variables, varargin)
        % Create a quadratic point function.
        %  
        % <Syntax>
        % [ f ] = falcon.lib.SimpleQuadraticPointFunction(variables)
        % [ f ] = falcon.lib.SimpleQuadraticPointFunction(..., 'Name', Value)
        %  
        % <Description>
        % Create a quadratic point function (objective/constraint) of the
        % form
        %   value = 0.5 * sum[i]((v[i] - v0[i])' * W[i] * (v[i] - v0[i]))
        % with a vector of variables v (including States, Controls,
        % Parameters and Outputs in arbitrary order), offset vector v0 and
        % weight matrix W; the subscript i represents a sample index.
        %  
        % The function accepts inputs from a single phase only.  However,
        % multiple samples from this phase may be used.
        %  
        % Note: If the function is applied to multiple samples and v
        % includes parameters, these are replicated to all samples.
        % For example, given v = [p] with a parameter p, constant weights
        % W[i] = W and offsets v0[i] = v0 = [p0] and N samples, the
        % result is N * (p - p0)' * W * (p - p0).
        %  
        % <Inputs>
        % > variables: The vector of variables v.
        %  
        % <NameValue>
        % > WeightMatrix: The weights corresponding to v, specified either
        %   as a matrix W with W[i] = W for all i, or a 3D array with
        %   varying weights, W = cat(3, W[1], ... W[N]).
        %   Defaults to identity.
        % > Offset: The offsets corresponding to v, specified either as a
        %   column vector v0 with v0[i] = v0 for all i, or a matrix with
        %   varying offsets, V0 = [v0[1] ... v0[N]].
        %   Defaults to zero.
        % > NumSamples: The number of samples N where i ranges from 1 to N.
        %   Defaults to the maximum number of columns of W and V0.
        end

    end

end