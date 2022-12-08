classdef DerivativeMatlab < falcon.core.builder.DerivativeEvaluator
    % DERIVATIVEMATLAB Summary of this class goes here
    %   Detailed explanation goes here

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
        % Directory of the current project
        ProjectDir
        % Directory of the current projects derivatives
        ProjectDerivativeDir
        % Directory of the current projects multiple evaluation code
        ProjectCodeDir
        % Directory of the current projects output function
        ProjectOutputDir
        % Name of the current project
        ProjectName
        % Input information of current project
        InputTable
        % Output information of current project
        OutputTable
        % Derviative flags
        DerivativeOrder
        % Projects type string
        Type
        % Model wrapper / interface support class
        ModelWrapperClass
        % Flag if multi threading is performed
        MultiThreading
        % PrintLevel
        PrintLevel
        % Number of Derivative Variables
        NumDerivativeVariables
    end

    methods
        function Run(obj)
        % falcon.core.builder.DerivativeMatlab/Run is a function.
        %   Run(obj)
        end

        function obj = DerivativeMatlab(derivativeProvider, configuration)
        % DERIVATIVEMATLAB Summary of this class goes here
        %   Detailed explanation goes here
        end

        function [derivativesCorrect, gradientCorrect, hessianCorrect, derivatives] = CheckDerivatives(obj, varargin)
        % Checks the analytic created gradient of the model with the
        % numeric gradient.
        %  
        % <Keywords>
        % Derivative!Check
        end

    end

end