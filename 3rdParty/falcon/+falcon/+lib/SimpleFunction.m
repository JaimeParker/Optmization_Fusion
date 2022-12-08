classdef (Abstract) SimpleFunction < handle
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
        function self = SimpleFunction(variables)
        % -------------------------------------------------------------------------
        %                                FALCON.m
        % Copyright (c) 2014-2019 Institute of Flight System Dynamics, TUM, Munich
        % Matthias Bittner, Matthias Rieck, Maximilian Richter,
        % Benedikt Grueter, Johannes Diepolder, Florian Schwaiger,
        % Patrick Piprek, and Florian Holzapfel
        % Downloading, using, copying, or modifying FALCON.m code constitutes an
        % agreement to ALL of the terms of the FALCON.m EULA.
        % -------------------------------------------------------------------------
        end

        function info = describe(self)
        % falcon.lib.SimpleFunction/describe is a function.
        %   obj = falcon.lib.SimpleFunction
        end

        function [val, jac, hess] = evaluate(self, varargin)
        % falcon.lib.SimpleFunction/evaluate is a function.
        %   obj = falcon.lib.SimpleFunction
        end

    end

end