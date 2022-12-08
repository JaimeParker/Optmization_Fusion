classdef SimulationModelBuilder < falcon.core.builder.BaseBuilder
    % Creates a dynamic model that includes jacobian and hessian
    % (optional) derivatives.

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
        % Flag if the Simulation Model has Outputs
        HasOutputs
        % Flag for setting builder to analytic derivative mode.
        DERIVATIVE_ANALYTIC
        % Flat for setting builder to finite difference derivative
        % mode.
        DERIVATIVE_FINITE_DIFFERENCE
        % Flag for settin builder to mex evaluation mode.
        EVALUATION_MEX
        % Flag for setting builder to matlab evaluation mode.
        EVALUATION_MATLAB
        % Flag for setting builder to no evaluation mode. (No wrapper is
        % created)
        EVALUATION_NONE
        % falcon.core.builder.BaseBuilder.TYPE_OUTPUT is a property.
        TYPE_OUTPUT
        % falcon.core.builder.BaseBuilder.TYPE_STATE is a property.
        TYPE_STATE
        % falcon.core.builder.BaseBuilder.TYPE_CONTROL is a property.
        TYPE_CONTROL
        % falcon.core.builder.BaseBuilder.TYPE_PARAMETER is a property.
        TYPE_PARAMETER
        % falcon.core.builder.BaseBuilder.TYPE_VALUE is a property.
        TYPE_VALUE
        % falcon.core.builder.BaseBuilder.TYPE_DISCRETE is a property.
        TYPE_DISCRETE
        % falcon.core.builder.BaseBuilder.TYPE_CONSTANT is a property.
        TYPE_CONSTANT
        % Name of the model or function project
        ProjectName
        % Holds the handle if a single function is used to define the
        % function or Model / Constraint or Cost
        SimpleFunctionHandle
        % Perform Code Optimization
        OptimizeCode
        % <internal>
        % Specifies if code for debugging of numerical issues should be added.
        DebugNumericalAccuracy
        % Flag that determined if the project was already build
        isBuilt
        % Handle to the constructed model / constraint function.
        Handle
    end

    methods
        function obj = SimulationModelBuilder(varargin)
        % Class to construct dynamic models in falcon.
        %  
        % <Syntax>
        % obj = falcon.SimulationModelBuilder(ProjectName, States)
        % obj = falcon.SimulationModelBuilder(ProjectName, States, Controls)
        % obj = falcon.SimulationModelBuilder(ProjectName, States, Controls, Parameters)
        % obj = falcon.SimulationModelBuilder(ProjectName, States, Controls, Parameters, Handle)
        % obj = falcon.SimulationModelBuilder(ProjectName, States, 'Name', Value)
        % obj = falcon.SimulationModelBuilder(..., 'Name', Value)
        %  
        % <Inputs>
        % >ProjectName: The name of the to be generated model. This is
        % the filename of the generated model.
        % >States:      State input of the model. Column vector of
        %               falcon.State objects or integer for number of
        %               states.  States can also be added later using the
        %               addState() method.
        % >Controls:    Control input of the model. Column vector of
        %               falcon.Control objects or integer for number of
        %               controls. Use [] or 0 to set no controls.  The
        %               default is [].  Controls can also be added later
        %               using the addControl() method.
        % >Parameters:  Parameter input of the model. Column vector of
        %               falcon.Parameter objects or integer for number of
        %               parameters. Use [] or 0 to set no parameters.  The
        %               default is [].  Parameters can also be added later
        %               using the addParameter() method.
        % >Handle:      Function Handle for models that are described using
        %               a single matlab function (Function Mode). Leave empty if you want to construct a model
        %               using subsystems (Subsystem Mode). (default: [])
        %  
        % <NameValue>
        % >DerivativeMode:  Flag that defines if the derivatives are calculated
        %                   using symbolic differentiation ('analytic')
        %                   or using finite differences('finite_difference'). (default = 'analytic')
        % >Optimize:        Set the Optimization option for symbolic
        %                   differentiation. (Function Mode default=false,
        %                   Subsystem Model default = true)
        % >DoDependencyCheck:  Flag that enables a check if a subsystem
        %                   is dependent on other subsystems. (default
        %                   = false)
        % >DerivativeOrder: Set the order of the highest derivatives to
        %             generate (default = 1)
        %  
        % <Outputs>
        % >obj:         The falcon.SimulationModelBuilder instance.
        %  
        % <Keywords>
        % Constructor!Model Builder
        end

        function self = addOutput(self, outputs)
        % Add an output to the model.
        %  
        % <Syntax>
        % builder = builder.addOutput(outputs)
        %  
        % <Description>
        % Add one or more outputs to the model.
        %  
        % <Inputs>
        % > outputs: cell string or falcon.Output array
        end

        function self = addParameter(self, parameters)
        % Add a parameter input to the model.
        %  
        % <Syntax>
        % builder = builder.addParameter(parameters)
        %  
        % <Description>
        % Add one or more parameter inputs to the model.
        %  
        % <Inputs>
        % > parameters: cell string or falcon.Parameter array
        end

        function self = addControl(self, controls)
        % Add a control input to the model.
        %  
        % <Syntax>
        % builder = builder.addControl(controls)
        %  
        % <Description>
        % Add one or more control inputs to the model.
        %  
        % <Inputs>
        % > controls: cell string or falcon.Control array
        end

        function self = addState(self, states, derivatives)
        % Add a dynamic state to the model.
        %  
        % <Syntax>
        % builder = builder.addState(states, derivatives)
        %  
        % <Description>
        % Add one or more model states and the corresponding state
        % derivative names.  This allows you to conveniently define an
        % integrator at any time during the model construction, instead of
        % specifying all states in the SimulationModelBuilder constructor.
        %  
        % Note: When using addState(), the derivative names are specified
        % directly in the same function call, thus there is no need to call
        % setStateDerivativeNames() anymore.  If setStateDerivativeNames()
        % is called anyway, the derivative names for all states need to be
        % provided again.  Therefore, it is recommended to use either the
        % traditional setup method (specify states in the builder
        % constructor, set the derivative names later), or the new,
        % flexible addState() interface, but not both at the same time.
        %  
        % <Inputs>
        % > states: cell string or falcon.State array
        % > derivatives: cell string
        end

        function flags = hasOutput(self, outputs)
        % Check if the model has outputs with the given names.
        %  
        % <Syntax>
        % flags = builder.hasOutputs()
        %  
        % <Inputs>
        % > outputs: cell string or falcon.Output array
        %  
        % <Outputs>
        % > flags: logical array
        end

        function flags = hasParameter(self, parameters)
        % Check if the model has parameters with the given names.
        %  
        % <Syntax>
        % flags = builder.hasParameter()
        %  
        % <Inputs>
        % > parameters: cell string or falcon.Parameter array
        %  
        % <Outputs>
        % > flags: logical array
        end

        function flags = hasControl(self, controls)
        % Check if the model has controls with the given names.
        %  
        % <Syntax>
        % flags = builder.hasControl()
        %  
        % <Inputs>
        % > controls: cell string or falcon.Control array
        %  
        % <Outputs>
        % > flags: logical array
        end

        function flags = hasState(self, states)
        % Check if the model has states with the given names.
        %  
        % <Syntax>
        % flags = builder.hasState()
        %  
        % <Inputs>
        % > states: cell string or falcon.State array
        %  
        % <Outputs>
        % > flags: logical array
        end

        function names = getOutputNames(self)
        % Get the names of all model outputs.
        %  
        % <Syntax>
        % names = builder.getOutputNames()
        %  
        % <Outputs>
        % > names: cell string
        end

        function names = getParameterNames(self)
        % Get the names of all model parameters.
        %  
        % <Syntax>
        % names = builder.getParameterNames()
        %  
        % <Outputs>
        % > names: cell string
        end

        function names = getControlNames(self)
        % Get the names of all control inputs.
        %  
        % <Syntax>
        % names = builder.getControlNames()
        %  
        % <Outputs>
        % > names: cell string
        end

        function names = getStateDerivativeNames(self)
        % Get the names of all model state derivatives.
        %  
        % <Syntax>
        % names = builder.getStateDerivativeNames()
        %  
        % <Outputs>
        % > names: cell string
        end

        function names = getStateNames(self)
        % Get the names of all model states.
        %  
        % <Syntax>
        % names = builder.getStateNames()
        %  
        % <Outputs>
        % > names: cell string
        end

        function setOutputs(obj, outputs)
        % Set the output of the model
        %  
        % <Syntax>
        % obj.setOutputs(outputs)
        %  
        % <Description>
        % Set the size of outputs of the model. This information is
        % used for the construction of the derivatives and wrapper
        % file. In case of subsystem mode the actual names of the
        % outputs have to be provided using falcon.Output.  Outputs can
        % also be added anytime using the addOutput() method.
        %  
        % <Inputs>
        % >outputs: numeric value specifying the number of outputs
        % (simple mode only). Alternatively use falcon.Output column
        % vector to set the size and names of outputs (required for
        % subsystem mode).
        %  
        % <Keywords>
        % Model Builder!Outputs
        end

        function setStateDerivativeNames(obj, varargin)
        % Set the state derivative names used in subsystem mode.
        %  
        % <Syntax>
        % obj.setStateDerivativeNames(names)
        %  
        % <Description>
        % This function sets the names of the state derivatives for the
        % subsystem mode. These names are used to build the state
        % derivatives correctly.
        %  
        % It is recommended not to use this method in combination with the
        % more recent addState() function.
        %  
        % <Input>
        % >names: cell array of strings or single string (one state
        % dynamic models only)
        %  
        % <Keywords>
        % Model Builder!Deriv Names
        end

        function g = plot(self)
        % Visualize the model structure using
        % falcon.core.builder.ModelStructureVisualizer
        end

        function [derivativesCorrect, gradientCorrect, hessianCorrect, derivatives] = CheckDerivatives(obj, varargin)
        % Check Derivatives of the generated project
        %  
        % <Keywords>
        % Debugging!Model!Derivative Check
        end

        function SplitVariable(obj, name, entries, varargin)
        % Split a single variable into multiple parts
        %  
        % <Syntax>
        % obj.SplitVariable(name, entries)
        % obj.SplitVariable(name, entries, rowsplit, colsplit)
        %  
        % <Description>
        % Split large variables into smaller heaps. Since the method
        % uses mat2cell interally the block structure and summation of
        % rows and columns must fit. If the size of entries is the same
        % as the size of the variable name, rowsplit and colsplit do
        % not have to be provided. Otherwise the sum of rowsplit and
        % sum of colsplit must fit the size of the variable name
        % respectively. Not available in SimpleMode.
        %  
        % <Inputs>
        % > name: name of original variable
        % > entries: name of new entries, which is orientation
        % sensitive.
        %  
        % <Optional>
        % > rowsplit: row distribution
        % > colsplit: column distribution
        %  
        % <Keywords>
        % Base Builder!Variables!Split
        end

        function CombineVariables(obj, name, vars, varargin)
        % Combine multiple variables to a single variable
        %  
        % <Syntax>
        % obj.CombineVariables(name, vars)
        %  
        % <Description>
        % Combine multiple variables to a single variable to simplify
        % the construction code. Not available in SimpleMode.
        %  
        % <Inputs>
        % > name: Name of the new variable
        % > vars: Cell array of strings. vars is orientation sensitive,
        % meaning {'a', 'b', 'c'} and {'a'; 'b'; 'c'} will create
        % different variables. Variables must have a matching block
        % structure (see mat2cell).
        %  
        % <Keywords>
        % Base Builder!Variables!Combine
        end

        function addVariantSubsystem(self, varargin)
        % Add a variant subsystem.
        %  
        % <Syntax>
        % obj.addVariantSubsystem(variantSystemDefinition)
        %  
        % <Description>
        % A variant system switches between multiple functions according to
        % the value of a variant control input (a scalar, discrete,
        % non-derivative variable).
        %  
        % <Inputs>
        % > variantSystemDefinition:
        %   A falcon.core.builder.VariantSystemDefinition instance.
        %  
        % <Keywords>
        % Base Builder!VariantSubsystem
        end

        function addDerivativeSubsystem(obj, Subsystem, Inputs, Outputs, varargin)
        % Add Subsystem which already provides derivatives to the project
        %  
        % <Syntax>
        % obj.addDerivativeSubsystem(Subsystem, Inputs, Outputs)
        % obj.addDerivativeSubsystem(Subsystem, 'Inputs', Inputs, 'Outputs', Outputs)
        % obj.addDerivativeSubsystem(.., 'Name', Value)
        %  
        % <Description>
        % Adds a subsystem to the subsystem chain of the project which
        % already calculates derivatives. This enables the use of
        % lookup tables or similar function in the subsystem chain. A
        % funtion handel to the subsystem, inputs and outputs have to
        % be specified. In case Name Value pairs are not set
        % (OutputSizes) FALCON.m uses a nan call to the function to
        % determine the output sizes, jacobian (and hessian) sparsity
        % structure. If the function call cannot handle nan inputs,
        % output sizes and sparsity patterns have to be provided.
        %  
        % <Inputs>
        % > Subsystem: Must be a simple function handle (anonymous
        % functions or matlab.System classes are not supported)
        % > Inputs: Input arguments cell array. Entries in the cell can
        % either be numeric, a variable string, cell array of variable
        % strings. Constant inputs (numeric, constant values) must not
        % have their derivatives returned by the derivative subsystem.
        % > Outputs: Output arguments cell array. Entries in the cell
        % can either be a variable string. Cell array of variable
        % strings are not supported. Ignoring an output using '~' is
        % not supported.
        %  
        % <NameValue>
        % The following name value pairs are optional, but in case on
        % is set the all relevant information has to be given.
        % > OutputSizes: The size of each output value.
        % > OutputJacobianSparsity: The sparsity pattern of the output
        % jacobian given as a matrix of zeros and ones.
        % > OutputHessianSparsity: The sparsity pattern of the output
        % hessian given as a matrix of zeros and ones.
        %  
        % <Keywords>
        % Base Builder!Derivative Subsystem
        end

        function addSubsystem(obj, Subsystem, varargin)
        % Add Subsystem to the project to create its derivatives.
        %  
        % <Syntax>
        % obj.addSubsystem(Subsys, Inputs, Outputs)
        % obj.addSubsystem(Subsys, 'Inputs', Inputs, 'Outputs', Outputs)
        % obj.addSubsystem(Subsys, {matrix, 'varstr', {'a','b';'c','d'})
        % obj.addSubsystem(.., 'Name', Value)
        %  
        % <Description>
        % Add a subsystem to the model / constraint.
        %  
        % <Inputs>
        % > Subsys: anonymous function, simple function handle or
        % matlab.System class instance.
        % > Inputs: Input arguments cell array. Entries in the cell can
        % either be numeric (scalar, vector, matrix), a variable string, cell array of variable
        % strings (variables in cell array must be concatable).
        % > Outputs: Output arguments cell array. Entries in the cell
        % can either be a variable string, a cell array of variable
        % strings. In the latter case the size of the cell array must
        % fit the output size. Additionally, a '~' can be used to
        % ignore an output.
        %  
        % <NameValue>
        % > Optimize: Flag that sets the optimization option for the derivative
        % creation (analytic derivative mode only). (default = true)
        %  
        % <Keywords>
        % Base Builder!Subsystem
        end

        function addConstant(obj, Name, Value, varargin)
        % Add a internal constant to the project
        %  
        % <Syntax>
        % obj.addConstant(Name, Value)
        %  
        % <Description>
        % Set constant values in Subsystem Mode. Values are internal
        % and cannot be influence from the outside. For additional
        % inputs use the addConstantInput method. This method throws an
        % error if called in Function Mode.
        %  
        % <Inputs>
        % > Name: Name of the constant. (string)
        % > Value: Value of the constant. (numeric, scalar, vector or
        % matrix).
        %  
        % <Keywords>
        % Base Builder!Constant
        end

        function addConstantInput(obj, Name, varargin)
        % Add a constant input to the dynamic model.
        %  
        % <Syntax>
        % obj.addConstantInput(Name)
        % obj.addConstantInput(Name, VariableSize, 'MultipleTimeEval',Value)
        % obj.addConstantInput(Name, VariableSize, 'MultipleTimeEval',Value)
        % obj.addConstantInput(.., 'Name',Value)
        %  
        % <Description>
        % Additional constant inputs to the model / constraint can be
        % set using this function. They will be added in order of
        % occurence after the main input sequence f(x,u,p,c1,c2,...).
        % These constant inputs can be set and changed externally and
        % are not hard-coded. This makes testing different model types
        % efficient. They must be added to the model in the problem
        % using the setConstant-method and thus, only the size is
        % specified here.
        %  
        % <Required>
        % > Name: Name of input. (string)
        %  
        % <Optional>
        % > VariableSize: Either a numeric dimension [m,n] (must
        % be 1 by 2 row vector) or a cell array of string specifying
        % multiple [1,1] entries to the model. This is the size used
        % for each non-dimensional time step.
        %  
        % <NameValue>
        % MultipleTimeEval: Flag to determine if the constant is
        % changing at each non-dimensional time step. This allows for
        % the evaluation of different constant values alongside the
        % trajectory. Note that the specified variable size is
        % defined as the size of the input at each time step
        % individually. Here, only column vectors, i.e.,
        % VariableSize = [n,1] is supported.
        %  
        % <Keywords>
        % Base Builder!Constant!Input
        end

        function handle = Build(obj, varargin)
        % Builds the current project
        %  
        % <Syntax>
        % handle = obj.Build()
        % handle = obj.Build('Name', Value)
        %  
        % <Description>
        % Builds the current project, which means the derivative
        % function interface is constructed. Afterwards the evaluation
        % function is created. Additional settings for the evaluation
        % function can be set.
        %  
        % <NameValue>
        % > EvaluationProvider: text ('mex' generates a c++ mex file
        %   wrapper and mex function, 'matlab' creates a Matlab function,
        %   'none' will prevent the construction of the evaluation wrapper;
        %   default='mex') or a
        %   falcon.core.builder.DerivativeEvaluatorConfiguration object.
        % > MultiThreading: Flag to compile the model with
        % multi-threading (default: false)
        % > OutputFolder: Folder to which the compiled/generated model
        % is going to be saved (default: pwd).
        %  
        % <Outputs>
        % > handle: see get.Handle. In case 'none' was chosen for the
        % evaluation provider, handle is empty []
        %  
        % <Keywords>
        % Base Builder!Build
        end

        function arr = SimpleModeOutputVariableProcessing(arr)
        % falcon.core.builder.BaseBuilder.SimpleModeOutputVariableProcessing is a function.
        %   arr = falcon.core.builder.BaseBuilder.SimpleModeOutputVariableProcessing(arr)
        end

    end

end