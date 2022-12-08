classdef (Abstract) DerivativeBuilder < falcon.core.Handle
    % FDERIVATIVEBUILDERINTERFACE abstract class for the generation of
    %  derivatives
    %  
    % TODO sicherstellen dass diese klasse nicht dokumentiert ist

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
        % Stores table with all input information
        InputTable
        % Stores table with all output information
        OutputTable
        % Stores information about all available variables
        AvailableVariableTable
        % Stores information about all internal constants
        ConstantTable
        % Name of project / identifier for the derivative to be constructed
        ProjectName
        % directory of the project
        ProjectDir
        % falcon.core.builder.DerivativeBuilder/DerivativeCache is a property.
        DerivativeCache
        % Parent directory of the project
        ParentDir
        % Generate Jacobian/Hessian?
        DerivativeOrder
        % Stores the number of input variables (number of matrix and vector
        % elements) whith respect to which the derivatives of the outputs
        % are calculated. The number stored here is used to initialize the
        % jacobians and hessians with appropriate size
        NumDerivativeVariables
        % Build trace stores the order of the subsystem / constants/
        % and collections
        BuildTrace
        % Specifies if the matlabFunction should generate optimized MATLAB
        % code (this property is currently used for fAnalyticGradient only)
        OptimizeCode
        % Type of Derivative Project
        Type
        % Model wrapper / interface support class
        ModelWrapperClass
        % Specifies if the derivative method checks if the subsystem
        % depends on not supervised function for the hash check
        DoDependencyCheck
        % Specifies if unused subsystems etc. should be eliminated.
        MinimizeBuild
    end

    methods
        function changed = BuildDerivatives(obj)
        % Build the derivatives
        %  
        % <Keywords>
        % Derivative Builder!Constant
        end

        function addConstant(obj, varargin)
        % Set a constant for the model. This constant will not be a
        % parameter entry to the model but a hard coded constant at the
        % beginning of the code.
        %  
        % <Syntax>
        % mdl.AddConstant('name', value)
        %  
        % <Inputs>
        % > name string name of the constant
        % > value scalar / vector or matrix of the constant value
        %  
        % <Keywords>
        % Derivative Builder!Constant
        end

        function addOutput(obj, OutputName, OutputEntries, type, requiredSize)
        % adds a new output to the build trace
        %  
        % <Keywords>
        % Derivative Builder!Outputs
        end

        function ProcessInputs(obj)
        % Process the inputs
        %  
        % <Keywords>
        % Derivative Builder!Inputs!Process
        end

        function setProjectName(obj, projectName)
        % Set project name
        %  
        % <Keywords>
        % Derivative Builder!Project
        end

        function setDoDerivative(obj, Idx, flag)
        % Set derivative flag.
        %  
        % <Keywords>
        % Derivative Builder!Flags
        end

        function addInput(obj, name, vardim, doderivative, multiple_time_eval, discrete_control, type, groupindex, entrysizes, varargin)
        % adds a new input to the build trace
        %  
        % <Keywords>
        % Derivative Builder!Input!Combine
        end

        function SplitVariable(obj, name, entries, varargin)
        % Split variables within builder
        %  
        % <Keywords>
        % Derivative Builder!Variables!Split
        end

        function CombineVariables(obj, name, vars, varargin)
        % Combines variables within builder
        %  
        % <Keywords>
        % Derivative Builder!Variables!Combine
        end

        function addVariantSubsystem(self, varargin)
        % falcon.core.builder.DerivativeBuilder/addVariantSubsystem is a function.
        %   addVariantSubsystem(self, varargin)
        end

        function addDerivativeSubsystem(obj, func, Inputs, Outputs, OutputSizes, OutputJacobianSparsity, OutputHessianSparsity, varargin)
        % Add derivative subsystem to derivative builder.
        %  
        % <Keywords>
        % Derivative Builder!Derivative Subsystem
        end

        function addSubsystem(obj, Subsystem, Inputs, Outputs, Optimize, varargin)
        % Add subsystem to derivative builder.
        %  
        % <Keywords>
        % Derivative Builder!Subsystem
        end

        function self = setDerivativeCache(self, cache)
        % falcon.core.builder.DerivativeBuilder/setDerivativeCache is a function.
        %   [self] = setDerivativeCache(self, cache)
        end

        function obj = DerivativeBuilder(varargin)
        % Constructs the Derivative Builder class
        % Generates the derivative code wrapper
        %  
        % <Keywords>
        % Contructor!Derivative Builder
        end

        function g = plot(self)
        % Visualize the model structure using
        % falcon.core.builder.ModelStructureVisualizer.
        end

        function dependencyGraph = createBuildTraceDependencyGraph(self, varargin)
        % falcon.core.builder.DerivativeBuilder/createBuildTraceDependencyGraph is a function.
        %   [dependencyGraph] = createBuildTraceDependencyGraph(self, varargin)
        end

    end

end