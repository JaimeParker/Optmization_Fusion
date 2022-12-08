classdef SimpleLinearPathFunction < falcon.lib.SimpleFunction
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
        % falcon.lib.SimpleLinearPathFunction/Weight is a property.
        Weight
        % falcon.lib.SimpleLinearPathFunction/Offset is a property.
        Offset
        % falcon.lib.SimpleLinearPathFunction/NumSamples is a property.
        NumSamples
        % falcon.lib.SimpleLinearPathFunction/StateWeight is a property.
        StateWeight
        % falcon.lib.SimpleLinearPathFunction/ControlWeight is a property.
        ControlWeight
        % falcon.lib.SimpleLinearPathFunction/ParameterWeight is a property.
        ParameterWeight
        % falcon.lib.SimpleLinearPathFunction/OutputWeight is a property.
        OutputWeight
        % falcon.lib.SimpleLinearPathFunction/StateOffset is a property.
        StateOffset
        % falcon.lib.SimpleLinearPathFunction/ControlOffset is a property.
        ControlOffset
        % falcon.lib.SimpleLinearPathFunction/ParameterOffset is a property.
        ParameterOffset
        % falcon.lib.SimpleLinearPathFunction/OutputOffset is a property.
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
        % FALCON.m PATH_FUNCTION interface.
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
        % Set the weight and offset coefficients.
        end

        function self = SimpleLinearPathFunction(variables, varargin)
        % Create a linear path function.
        %  
        % <Syntax>
        % [ f ] = falcon.lib.SimpleLinearPathFunction(variables)
        % [ f ] = falcon.lib.SimpleLinearPathFunction(..., 'Name', Value)
        %  
        % <Description>
        % Create a linear path function (objective/constraint) of the form
        %   value[m, i] = w[i]' * (v[i] - v0[i])
        % with a vector of variables v (including States, Controls,
        % Parameters and Outputs in arbitrary order), offset vector v0 and
        % weight vector w; the subscript i represents a sample index.
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
        end

    end

end