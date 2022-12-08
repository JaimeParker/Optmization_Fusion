classdef SimpleLinearPointFunction < falcon.lib.SimpleFunction
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
        % falcon.lib.SimpleLinearPointFunction/NumSamples is a property.
        NumSamples
        % falcon.lib.SimpleLinearPointFunction/Weight is a property.
        Weight
        % falcon.lib.SimpleLinearPointFunction/Offset is a property.
        Offset
        % falcon.lib.SimpleLinearPointFunction/StateWeight is a property.
        StateWeight
        % falcon.lib.SimpleLinearPointFunction/ControlWeight is a property.
        ControlWeight
        % falcon.lib.SimpleLinearPointFunction/ParameterWeight is a property.
        ParameterWeight
        % falcon.lib.SimpleLinearPointFunction/OutputWeight is a property.
        OutputWeight
        % falcon.lib.SimpleLinearPointFunction/StateOffset is a property.
        StateOffset
        % falcon.lib.SimpleLinearPointFunction/ControlOffset is a property.
        ControlOffset
        % falcon.lib.SimpleLinearPointFunction/ParameterOffset is a property.
        ParameterOffset
        % falcon.lib.SimpleLinearPointFunction/OutputOffset is a property.
        OutputOffset
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

        function self = setWeight(self, weight)
        % Set weight.
        %  
        % <Syntax>
        % f = f.setWeight(weight)
        %  
        % <Description>
        % Set the weight coefficients, preserving the number of samples.
        end

        function self = setWeightAndOffset(self, weight, offset)
        % Set weight and offset.
        %  
        % <Syntax>
        % f = f.setWeightAndOffset(weight, offset)
        %  
        % <Description>
        % Set the weight and offset coefficients, preserving the number of
        % samples.
        end

        function self = SimpleLinearPointFunction(variables, varargin)
        % Create a linear point function.
        %  
        % <Syntax>
        % [ f ] = falcon.lib.SimpleLinearPointFunction(variables)
        % [ f ] = falcon.lib.SimpleLinearPointFunction(..., 'Name', Value)
        %  
        % <Description>
        % Create a linear point function (objective/constraint) of the form
        %   value = sum[i] ( w[i]' * (v[i] - v0[i]) )
        % with a vector of variables v (including States, Controls,
        % Parameters and Outputs in arbitrary order), offset vector v0 and
        % weight vector w; the subscript i represents a sample index.
        %  
        % The function accepts inputs from a single phase only.  However,
        % multiple samples from this phase may be used.
        %  
        % Note: If the function is applied to multiple samples and v
        % includes parameters, these are replicated to all samples.
        % For example, given v = [p] with a parameter p, constant weights
        % w[i] = w and offsets v0[i] = v0 = [p0] and N samples, the result
        % is N * w * (p - p0).
        %  
        % <Inputs>
        % > variables: The vector of variables v.
        %  
        % <NameValue>
        % > Weight: The weights corresponding to v, specified either as a
        %   column vector w with w[i] = w for all i, or a matrix with
        %   varying weights, W = [w[1] ... w[N]].
        %   Defaults to one.
        % > Offset: The offsets corresponding to v, specified either as a
        %   column vector v0 with v0[i] = v0 for all i, or a matrix with
        %   varying offsets, V0 = [v0[1] ... v0[N]].
        %   Defaults to zero.
        % > NumSamples: The number of samples N where i ranges from 1 to N.
        %   Defaults to the maximum number of columns of W and V0.
        end

    end

end