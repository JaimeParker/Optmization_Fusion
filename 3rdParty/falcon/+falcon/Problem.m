classdef Problem < falcon.core.HasToStruct & falcon.core.Handle & falcon.core.HasName
    % Constructs a falcon.Problem object.
    %  
    % <Syntax>
    % obj = Problem(name)
    %  
    % <Description>
    % Creates a new FALCON.m problem ready to be used to solve an optimal
    % control problem.
    %  
    % <Inputs>
    % >name: The name of the problem as a string.
    %  
    % <NameValue>
    % >UseHessian: Use the analytic Hessian to solve this problem (if
    % available). (default: false)
    %  
    % <Keywords>
    % Constructor!Problem

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
        % Array keeping all falcon.core.Phases of this problem.
        Phases
        % Array keeping all falcon.Parameters of this problem.
        Parameters
        % Array keeping all falcon.core.PointFunction objects of this problem.
        PointConstraintFunctions
        % Array keeping all falcon.core.PointFunction objects used as Mayer
        % cost functions of this problem.
        MayerCostFunctions
        % Determines if the optimization problem has already been
        % baked. If true, the problem can no longer be altered. Use
        % falcon.Problem.UnBake to make it editable again.
        isCrunchy
        % The falcon.discretization.DiscretizationMethod method used to
        % discretize this optimal control problem. Use
        % falcon.Problem.setDiscretizationMethod to set this property.
        % Available discretization methods can be found in
        % falcon.discretization.'name'. (default =
        % falcon.discretization.Trapezoidal)
        DiscretizationMethod
        % Offset for the sum of all cost functions
        CostOffset
        % The numeric scaling factor for the sum of all cost functions.
        CostScaling
        % Flag that determines if the analytic Hessian (2nd Derivative)
        % of the problem is calculated (ipopt only).
        % The Hessian mode is invoked in the falcon.Problem
        % constructor.
        UseHessian
        % Flag that determines use of drawnow to allow for optimization
        % abort in OptiFunc.
        DisableAbort
        % Flag to determine whether the problem is already solved
        isSolved
        % Use simulation as initial guess for state
        doSimInitGuess
        % MajorIterLimit for shortcut problem.Solve
        MajorIterLimit
        % MajorFeasTol for shortcut problem.Solve
        MajorFeasTol
        % MajorOptTol for shortcut problem.Solve
        MajorOptTol
        % Get the sparsity pattern of the gradient matrix as a sparse matrix
        gSparsity
        % Get the sparsity pattern of the Hessian matrix as a sparse matrix
        HSparsity
        % extract and concatenate all state values
        StateValues
        % extract and concatenate all state names
        StateNames
        % extract and concatenate all control values
        ControlValues
        % extract and concatenate all control names
        ControlNames
        % extract and concatenate all output values
        OutputValues
        % extract and concatenate all output names
        OutputNames
        % extract and concatenate all state_dot values
        StateDotValues
        % extract and concatenate all output names
        StateDotNames
        % extract and concatenate all costates values
        CostateValues
        % extract and concatenate all post-processing values
        PostProcessedValues
        % extract and concatenate all post-processing names
        PostProcessedNames
        % extract real time of problem
        RealTime
        % Name of object.
        Name
    end

    methods
        function obj = setUseHessian(obj, useHessian)
        % falcon.Problem/setUseHessian is a function.
        %   obj = setUseHessian(obj, useHessian)
        end

        function [parameters, locations] = getParametersByName(self, names)
        % Get problem parameters by name.
        %  
        % <Syntax>
        % [parameters, locations] = problem.getParametersByName(names)
        %  
        % <Description>
        % Returns the parameters corresponding to the given names.  If a
        % parameter is not found, an exception is thrown.  If a name is
        % ambiguous, the first match is returned.
        %  
        % <Inputs>
        % > names: cellstr
        % > parameters: falcon.Parameter array
        % > locations: index array referring to problem.Parameters
        end

        function clearPostProcessing(obj)
        % falcon.Problem/clearPostProcessing is a function.
        %   clearPostProcessing(obj)
        end

        function addPostProcessingStep(obj, func, inargscell, calcValues)
        % Add a post processing step to be performed after the problem has been
        % solved.
        %  
        % <Description>
        % Add a post processing step to be performed after the problem has been
        % solved. The post-processing is always applied to the full
        % time interval and to all phases. Thus, it must support
        % element-wise operations.
        %  
        % <Syntax>
        % obj.addPostProcessingStep(func, inargscell, calcValues)
        %  
        % <Required>
        % >func: Function handle (anonymous and standard) with multiple
        % inputs and a output(s) calculating the post-processing
        % value(s).
        % >inargscell: Cell array containing the function input
        % arguments (in correct order) that are required to calculate
        % the post-processing value. All falcon objects can be used as
        % inputs including already calculated post-processed values.
        % >calcValues: A falcon.Value object containg the name of the
        % post-processed value as saved in the PostProcessedGrid of
        % the phase.
        %  
        % <Keywords>
        % Problem!Post Process!Add
        end

        function showCostFunctionValues(obj)
        % Extracts the values of the Mayer cost functions and prints them to the
        % console.
        %  
        % <Syntax>
        % obj.showCostFunctionValues()
        %  
        % <Description>
        % Show all Mayer cost functions in the console.
        %  
        % <Keywords>
        % Debugging!Problem!Cost Values
        end

        function [F, G, varargout] = SingleCallOptiFunc(obj, varargin)
        % Calls the function used to perform the numerical optimization.
        %  
        % <Syntax>
        % [F, G] = obj.SingleCallOptiFunc()
        %  
        % <Description>
        % The problem is solved by iteratively improving the solution. This method
        % calls the function used in this iteration once an calculates the current
        % constraint values and the current gradient. In case the problem was
        % solved, this method uses the optimal solution, otherwise it uses the
        % initial guess.
        %  
        % <Optional>
        % > z: The optimization parameter vector. If not specified the
        % initial guess or, if available, the optimal results us used.
        %  
        % <Outputs>
        % > F: The cost and constraint vector in the evaluated point. The first
        % entry holds the cost function.
        % > G: The sparse Jacobian df/dz of the problem.
        %  
        % <Keywords>
        % Problem!Opti Func; Discretization!Opti Func
        end

        function PlotGUI(obj)
        % Opens the graphical user interface for plotting of the current problem.
        %  
        % <Syntax>
        % obj.PlotGUI();
        %  
        % <Description>
        % Creates a new instance of the plot GUI using the current problem. In the
        % plot GUI, the user can select all available time histories in the problem
        % and create plots from them.
        %  
        % <Keywords>
        % Problem!GUI
        end

        function [statesTS, controlTS, outputTS, statesdotTS, postprocessedTS] = getTimeSeries(obj)
        % Extract the states, controls, outputs, statesdot and postprocessed values
        % into Matlab TimeSeries object.
        %  
        % <Syntax>
        % [statesTS, controlTS, outputTS, statesdotTS, postprocessedTS] = obj.getTimeSeries()
        %  
        % <Description>
        % Takes the states, controls, outputs, state derivatives and postprocessed
        % time histories of all phases in the problem and creates Matlab TimeSeries
        % objects from them.
        %  
        % <Outputs>
        % > statesTS: A TimeSeries object holding all states in the problem.
        % > controlTS: A TimeSeries object holding all controls in the problem.
        % > outputTS: A TimeSeries object holding all outputs in the problem.
        % > statesdotTS: A TimeSeries object holding all state derivatives in the problem.
        % > postprocessedTS: A TimeSeries object holding all postprocessed data in the problem.
        %  
        % <Keywords>
        % Debugging!Problem!Time Series
        end

        function varargout = CheckScaling(obj, varargin)
        % Check the scaling of the cost function, constraints values,
        % optimization variables as well as the gradient of the
        % problem.
        %  
        % <Syntax>
        % [F, G, z] = CheckScaling( z, 'Name', Value, ...)
        % [F, G, z] = CheckScaling( 'Name', Value, ...)
        %  
        % <Description>
        % This function checks the scaling of the z and the F vectors
        % as well as the gradient matrix G. A wellformed optimization
        % problem yields in the fact that all optimization parameters,
        % constraints, cost function as well as the entries of G have
        % the same magnitude (desired is abs(entry) < 10).
        %  
        % <Optional>
        % > z: The optimization parameter vector to be used for the analysis.
        % (default: zOpt if available, else zInitial)
        %  
        % <NameValue>
        % > zRange: Which optimization variables are checked. (default:
        % 1:zLength)
        % > fRange: Which constraint values are checked. (default:
        % 1:fLength)
        % > Tolerance: The tolerance for marking entry values as too
        % large (default: 10).
        % > SolverTol: The solver tolerance for checking violated
        % constraints (default: 1e-5).
        % > MinTolerance: The tolerance for marking entry values as too
        % small (default: 1e-1).
        % > doMinBound: Flag for visualizing small entries to the
        % matrix (default: false).
        %  
        % <Keywords>
        % Problem!Checks!Scaling
        end

        function [G, Gnum, gradientIsCorrect] = CheckGradient(obj, varargin)
        % Check the analytic gradient matrix of the problem against finite
        % differences.
        %  
        % <Syntax>
        % [g, gnum] = obj.CheckGradient('Name', Value)
        %  
        % <Description>
        % Calculates the analytic derivative of the problem and compares it to
        % finite differences.
        %  
        % <NameValue>
        % > z: The optimization parameter vector to be used for the analysis.
        % (default: zInitial)
        % > Delta_Z: The stepsize used for the finite differences. (default:
        % sqrt(eps))
        % > Tolerance: The tolerance for comparison of the numeric and the analytic
        % values. (default: 1e-4)
        % > Range: The range in z to be checked. (default: The whole z)
        % > Visualize: A boolean specifying if the result of the computation should
        % be displayed. (default: true)
        % > doRandomize: Flag that allows a randomization of the optimization
        % parameter vector considering bounds and magnitude (default: false).
        % > noSamples: Number of samples to randomly check the matrix
        % with respect to finite differences (default: 1).
        %  
        % <Outputs>
        % > G: The sparse analytic gradient matrix of the overall
        % problem. For multiple samples the last value is returned.
        % > Gnum: The sparse numeric gradient matrix of the overall
        % problem. For multiple samples the last value is returned.
        % > gradientIsCorrect: Flag indicating that, if true, the
        % matrix checks were successful for the respective samples.
        %  
        % <Keywords>
        % Problem!Checks!Gradient
        end

        function strc = ToStruct(obj, varargin)
        % Create a struct from this problem.
        %  
        % <Syntax>
        % strc = obj.ToStruct()
        % strc = obj.ToStruct('Name', Value)
        %  
        % <Description>
        % Extracts all relevant information from this problem and stores it
        % in the returned struct.
        %  
        % <NameValue>
        % >DebugData: Setting this option to true enables debug data in
        %   the ToStruct method.
        %  
        % <Keywords>
        % Debugging!Problem
        end

        function setMajorIterLimit(obj, MajorIterLimitVal)
        % Set the major iteration limit for the problem.Solve
        % method.
        %  
        % <Syntax>
        % obj.setMajorIterLimit(MajorIterLimitVal)
        %  
        % <Description>
        % Set the major iteration limit for the method
        % problem.Solve. Value will be assigned there to the
        % automatically created solver object.
        %  
        % <NameValue>
        % >MajorIterLimitVal: Numeric value of the limit.
        %  
        % <Keywords>
        % Solver!Limit!Iteration
        end

        function setMajorOptTol(obj, MajorOptTolVal)
        % Set the major optimality tolerance for the problem.Solve
        % method.
        %  
        % <Syntax>
        % obj.setMajorOptTol(MajorOptTolVal)
        %  
        % <Description>
        % Set the major optimality tolerance for the method
        % problem.Solve. Value will be assigned there to the
        % automatically created solver object.
        %  
        % <NameValue>
        % >MajorOptTolVal: Numeric value of the tolerance.
        %  
        % <Keywords>
        % Solver!Tolerance!Optimality
        end

        function setMajorFeasTol(obj, MajorFeasTolVal)
        % Set the major feasibility tolerance for the problem.Solve
        % method.
        %  
        % <Syntax>
        % obj.setMajorFeasTol(MajorFeasTolVal)
        %  
        % <Description>
        % Set the major feasibility tolerance for the method
        % problem.Solve. Value will be assigned there to the
        % automatically created solver object.
        %  
        % <NameValue>
        % >MajorFeasTolVal: Numeric value of the tolerance.
        %  
        % <Keywords>
        % Solver!Tolerance!Feasibility
        end

        function [z_opt, F_opt, status, lambda, mu, zl, zu, solver] = Solve(obj, varargin)
        % Solve the problem.
        %  
        % <Syntax>
        % [z_opt, F_opt, status, lambda, mu, zl, zu] = obj.Solve()
        % [z_opt, F_opt, status, lambda, mu, zl, zu] = obj.Solve(Solver)
        %  
        % <Description>
        % Solve the problem numerically either using the default solver and the
        % default settings or using the given numeric solver.
        %  
        % <Inputs>
        % Solver: The falcon.solver used to solve the problem. (default: IPOPT)
        %  
        % <Keywords>
        % Problem!Solve; Solver!Solve
        end

        function CreateDebugInfo(obj)
        % Create additional information helpful for debugging.
        %  
        % <Syntax>
        % obj.CreateDebugInfo()
        %  
        % <Description>
        % Creates Information not required for optimization but mainly
        % for debugging of the code. Information created includes zNames and
        % fNames.
        %  
        % <Keywords>
        % Debugging!Problem Information
        end

        function UnBake(obj)
        % UnBake the problem. Make it editable again.
        %  
        % <Syntax>
        % obj.UnBake()
        %  
        % <Description>
        % Make a problem editable again, that was already baked. This is especially
        % usefull when solving similar problems again and again.
        %  
        % <Keywords>
        % Problem!UnBake
        end

        function [states, outputs, simTime, statesDot] = Simulate(obj, varargin)
        % Integrate the optimized trajectory using standard matlab
        % solvers. The result will be a cell array containing all the
        % simulated states for the phases.
        %  
        % <Syntax>
        % [states,outputs,simTime,statesDot] = obj.Simulate()
        % [states,outputs,simTime,statesDot] = obj.Simulate(init_states)
        % [states,outputs,simTime,statesDot] = obj.Simulate(init_states,control_history)
        % [states,outputs,simTime,statesDot] = obj.Simulate(init_states,control_history,ode_solver)
        % [states,outputs,simTime,statesDot] = obj.Simulate(init_states,control_history,ode_solver,ode_options)
        % [states,outputs,simTime,statesDot] = obj.Simulate(init_states,control_history,ode_solver,ode_options,UseRealTime)
        % [states,outputs,simTime,statesDot] = obj.Simulate(init_states,control_history,ode_solver,ode_options,UseRealTime,SplitIntervals)
        % [states,outputs,simTime,statesDot] = obj.Simulate(init_states,control_history,ode_solver,ode_options,UseRealTime,SplitIntervals,UseODETimeStep)
        % [states,outputs,simTime,statesDot] = obj.Simulate(init_states,control_history,ode_solver,ode_options,UseRealTime,SplitIntervals,UseODETimeStep,UseBackwardInt)
        % [states,outputs,simTime,statesDot] = obj.Simulate(init_states,control_history,ode_solver,ode_options,UseRealTime,SplitIntervals,UseODETimeStep,UseBackwardInt,DoVisualization)
        % [states,outputs,simTime,statesDot] = obj.Simulate(init_states,control_history,ode_solver,ode_options,UseRealTime,SplitIntervals,UseODETimeStep,UseBackwardInt,DoVisualization,DoSensitivity)
        %  
        % <Description>
        % Simulate the system with controls and initial state of the optimization.
        %  
        % <NameValue>
        % > init_states: The initial state vector for the split
        % intervals. If backward integration is used the final values.
        % Default are values from the current state grid.
        % > control_history: The control history to be used for the
        % simulation. Default is the interpolated control grid.
        % > ode_solver: Solver type that should be used for the
        % integration (default: ode45). Specified as a string.
        % > ode_options: Specify an ode options struct used for the ode
        % solver. As default the standard ode settings are used.
        % > UseRealTime: Use the real, i.e. physical, time for the
        % simulation instead of the non-dimensional time tau (default:
        % true).
        % > SplitIntervals: Number of split intervals, i.e. intervals
        % that split the integration domain. This generally makes the
        % integration more stable.
        % > UseODETimeStep: Flag that specifies whether to use the
        % internal ode time step for the measurements or the time steps
        % from the optimization. Result might be helpful to determine
        % the required number of collocation steps (default: false).
        % > UseBackwardInt: Flag that specifies whether to use the
        % backward or forward integration in time (default: false).
        % > DoVisualization: Flag to visualize the results (default:
        % false)
        %  
        % <Outputs>
        % > states: Simulated states.
        % > outputs: Simulated outputs.
        % > simTime: The time grid the integration is carried out.
        % > statesDot: The state derivatives.
        %  
        % <Keywords>
        % Problem!Simulation
        end

        function FastBake(obj, varargin)
        % Fast bake the problem, i.e., only change initial guesses and
        % boundary conditions.
        %  
        % <Syntax>
        % obj.FastBake()
        %  
        % <Description>
        % This method provides a fast bake method after an initial bake
        % has already been conducted. Within this function no new
        % indices are calculated but only the optimization parameter
        % vector is adapted with regard to state and control guess as
        % well as initial and final boundaries. No problem changes can
        % be done in this function!
        %  
        % <NameValue>
        % > initGuessCtrlsCell: A cell containing the initial guess for
        % the control of each phase. If a phase should not be changed
        % leave the cell empty.
        % > initGuessStateCell: A cell containing the initial guess for
        % the state of each phase.
        % > InitialBoundariesCell: A cell containing the initial
        % boundary condition of each phase.
        % > InitialBoundariesCell: A cell containing the final
        % boundary condition of each phase.
        %  
        % > UpdateInitialGuess: A logical to either overwrite (true) or
        % keep (false) the initial guess
        % <Keywords>
        % gPC Problem!Fast Bake
        end

        function Bake(obj, varargin)
        % Bake the problem. (Prepare it for being solved).
        %  
        % <Syntax>
        % obj.Bake()
        %  
        % <Description>
        % Bake the problem in order to prepare it for solving. The method needs
        % to be called before the problem can be solved by any numeric solver. If
        % you try to solve the problem with default settings using the method
        % Problem.Solve() it will be baked automatically. Altering a problem after
        % baking it is not possible. If you still want to change it, use
        % Problem.UnBake().
        %  
        % <Keywords>
        % Problem!Bake
        end

        function setSimInitGuess(obj, SimInitGuessFlag)
        % Set the flag that determines whether to use a simulation for
        % the initial guess of the states within each phase or not.
        %  
        % <Syntax>
        % obj.setSimInitGuess(SimInitGuessFlag)
        %  
        % <Description>
        % Sets the boolean value of the simulation flag for the initial
        % guess.
        %  
        % <Inputs>
        % > SimInitGuessFlag: Boolean determining whether to use a
        % simulation for the initial guess (true) or not (false).
        % (defaul: false)
        %  
        % <Keywords>
        % Problem!Simulation!Flag
        end

        function setCostOffset(self, offset)
        % falcon.Problem/setCostOffset is a function.
        %   setCostOffset(self, offset)
        end

        function setCostScaling(obj, CostScaling)
        % Set the numeric scaling of the overall cost function value
        %  
        % <Syntax>
        % obj.setCostScaling(CostScaling)
        %  
        % <Description>
        % Sets the numeric value as the numeric scaling value for the overall cost
        % function.
        %  
        % <Inputs>
        % > CostScaling: A numeric value used for scaling the cost function.
        %  
        % <Keywords>
        % Problem!Cost!Scaling
        end

        function setDiscretizationMethod(obj, DiscretizationMethod)
        % Set the discretization method of this problem.
        %  
        % <Syntax>
        % obj.setDiscretizationMethod(DiscretizationMethod)
        %  
        % <Description>
        % Sets the given discretization method as the discretization method used to
        % solve this optimal control problem.
        %  
        % <Inputs>
        % > DiscretizationMethod: A handle to a child class of
        % falcon.discretization.DiscretizationMethod containing all the functions
        % required to discretize an optimal control problem before solving it. The
        % usable classes shipped with falcon can be found in falcon.discretization.
        %  
        % <Keywords>
        % Problem!Discretization Method; Solver!Discretization Method;
        end

        function addProblemExtension(obj, probExt)
        % Adds an existing problem extension to the stack
        %  
        % <Syntax>
        % obj.addProblemExtension(probExt)
        %  
        % <Inputs>
        % >probExt: Problem extension instance
        %  
        % <Keywords>
        % Problem!Extension
        end

        function [cost, pointFunction] = addNewQuadraticPointCost(self, variables, varargin)
        % Minimize (default) or maximize a quadratic form.
        %  
        % <Syntax>
        % problem.addNewQuadraticPointCost(variables)
        % problem.addNewQuadraticPointCost(variables, Phase)
        % problem.addNewQuadraticPointCost(variables, Phase, NormalizedTime)
        % problem.addNewQuadraticPointCost(..., 'Name', Value)
        %  
        % <Description>
        % Add a quadratic point cost function of the form
        %   sum[i] ( (v[i] - v0[i])' * W[i] * (v[i] - v0[i]) )
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
        % W[i] = W and offsets v0[i] = v0 = [p0] and N samples, the result
        % is N * (p - p0)' * W * (p - p0).
        end

        function [cost, pointFunction] = addNewLinearPointCost(self, variables, varargin)
        % Minimize (default) or maximize given variables.
        %  
        % <Syntax>
        % problem.addNewLinearPointCost(variables)
        % problem.addNewLinearPointCost(variables, Phase)
        % problem.addNewLinearPointCost(variables, Phase, NormalizedTime)
        % problem.addNewLinearPointCost(..., 'Name', Value)
        %  
        % <Description>
        % Add a linear point cost function of the form
        %   sum[i] ( w[i]' * (v[i] - v0[i]) )
        % with a vector of variables v (including States, Controls,
        % Parameters and Outputs in arbitrary order), offset vector v0 and
        % weight vector w; the subscript i represents a sample index.
        %  
        % Note: If the function is applied to multiple samples and v
        % includes parameters, these are replicated to all samples.
        % For example, given v = [p] with a parameter p, constant weights
        % w[i] = w and offsets v0[i] = v0 = [p0] and N samples, the result
        % is N * w * (p - p0).
        end

        function MayerFunction = addNewMayerCost(obj, FunctionHandle, varargin)
        % Add a new Mayer cost function to the Problem.
        %  
        % <Syntax>
        % obj.addNewMayerCost(FunctionHandle)
        % obj.addNewMayerCost(FunctionHandle, Cost)
        % obj.addNewMayerCost(FunctionHandle, Cost, Phase1, NormalizedTime1)
        % obj.addNewMayerCost(FunctionHandle, Cost, Phase1, NormalizedTime1, Phase2, NormalizedTime2)
        % obj.addNewMayerCost(FunctionHandle, Cost, ..., PhaseN, NormalizedTimeN)
        %  
        % <Description>
        % Creates a new PointFunction and adds it to the list of Mayer cost functions
        % of the problem.
        %  
        % <Inputs>
        % > FunctionHandle: The function handle to the function used to calculate
        % this path constraint. For more information on the function handle see
        % falcon.PointFunction or falcon.PointConstraintBuilder. If not specified via a
        % point constraint builder file, the function handle must
        % fulfill the following header convention (if in doubt, please let
        % Falcon.m create the function interface for you):
        %   Cost = FunctionHandle(outputs, states, controls, parameters);
        %   Cost: a scalar cost value
        %   outputs: column vector of outputs, if the model has some
        %   (otherwise this input is omitted)
        %   states: column vector of states
        %   controls: column vector of controls, if the model has some
        %   (otherwise this input is omitted)
        %   parameters: column vector of parameters, that were set by
        %   setParameters method (otherwise the input is omitted)
        % > Cost: The Cost object defining the name of the output.
        % > Phase..: The phases where the data for this PointConstraint should be
        % taken from.
        % > NormalizedTime..: The normalized time points where the data should be
        % taken. Each input phase requires its own normalized time vector.
        %  
        % <Keywords>
        % Problem!Cost!Mayer
        end

        function ConstraintFunction = addNewPointConstraint(obj, FunctionHandle, Constraints, varargin)
        % Add a new point constraint to the Problem.
        %  
        % <Syntax>
        % obj.addNewPointConstraint(FunctionHandle, Constraints, Phase1, NormalizedTime1)
        % obj.addNewPointConstraint(FunctionHandle, Constraints, Phase1, NormalizedTime1, Phase2, NormalizedTime2)
        % obj.addNewPointConstraint(FunctionHandle, Constraints, ..., PhaseN, NormalizedTimeN)
        %  
        % <Description>
        % Creates a new PointFunction object and adds it to the problem.
        %  
        % <Inputs>
        % > FunctionHandle: The function handle to the function used to calculate
        % this point constraint. For more information on the function handle see
        % falcon.PointFunction or falcon.PointConstraintBuilder. If not specified via a
        % point constraint builder file, the function handle must
        % fulfill the following header convention (if in doubt, please let
        % Falcon.m create the function interface for you):
        %   constraints = FunctionHandle(outputs, states, controls, parameters);
        %   constraints: column vector of constraints
        %   outputs: column vector of outputs, if the model has some
        %   (otherwise this input is omitted)
        %   states: column vector of states
        %   controls: column vector of controls, if the model has some
        %   (otherwise this input is omitted)
        %   parameters: column vector of parameters, that were set by
        %   setParameters method (otherwise the input is omitted)
        % > Constraints: The Constraint objects defining the name, boundaries,
        % scaling and offset of the output
        % > Phase..: The phases where the data for this PointConstraint should be
        % taken from.
        % > NormalizedTime..: The normalized time points where the data should be
        % taken. Each input phase requires its own normalized time vector.
        %  
        % <Keywords>
        % Problem!Point Constraint
        end

        function ConnectAllPhases(obj)
        % Connect all phases in the problem.
        %  
        % <Syntax>
        % obj.ConnectAllPhases()
        %  
        % <Description>
        % Creates constraints that link each phase in the problem to the next phase
        % in the problem. The ordering is equal to the ordering in which the phases
        % have been added to the problem.
        %  
        % <Keywords>
        % Problem!Phase!Connect All
        end

        function ConnectPhases(obj, prevPhase, nextPhase, varargin)
        % Connect two phases in the problem.
        %  
        % <Syntax>
        % obj.ConnectPhases(prevPhase, nextPhase)
        %  
        % <Description>
        % Creates constraints that link two phases to each other. In the converged
        % result, the states at the end of the left phase will be equal to those at
        % the beginning of the right phase.
        %  
        % <Inputs>
        % > leftPhase: The left one of the two falcon.core.Phase objects to be
        % connected. The last state of this phase will be forced to be equal to the
        % first one of the right phase.
        % > rightPhase: The right one of the two falcon.core.Phase objects to be
        % connected. The first state of this phase will be forced to be equal to the
        % last one of the left phase.
        %  
        % <Keywords>
        % Problem!Phase!Connect
        end

        function phase = addNewPhase(obj, ModelHandle, States, NormalizedTime, StartTime, FinalTime)
        % Add a new Phase to the Problem.
        %  
        % <Syntax>
        % obj.addNewPhase(ModelHandle, States, NormalizedTime, StartTime, FinalTime)
        %  
        % <Description>
        % Creates a new phase, adds it to the list of phases of this problem and
        % returns a handle to it.
        %  
        % <Inputs>
        % > ModelHandle: The function handle to the simulation model.
        % > States: The falcon.State objects used in this phase.
        % > NormalizedTime: The normalized time spacing of this phase.
        % > StartTime: The start time of this phase in realtime. Input must either be
        % a positive scalar (time is fixed) or an falcon.Parameter
        % > FinalTime: The final time of this phase in realtime. Input must either be
        % a positive scalar (time is fixed) or an falcon.Parameter
        %  
        % <Keywords>
        % Problem!Phase
        end

        function obj = Problem(name, varargin)
        % Constructs a falcon.Problem object.
        %  
        % <Syntax>
        % obj = Problem(name)
        %  
        % <Description>
        % Creates a new FALCON.m problem ready to be used to solve an optimal
        % control problem.
        %  
        % <Inputs>
        % >name: The name of the problem as a string.
        %  
        % <NameValue>
        % >UseHessian: Use the analytic Hessian to solve this problem (if
        % available). (default: false)
        %  
        % <Keywords>
        % Constructor!Problem
        end

        function OpenPlotGUI(problemOrStruct)
        % Opens the plot graphical user interface with the given problem.
        %  
        % <Syntax>
        % falcon.Problem.OpenPlotGUI(problem);
        % falcon.Problem.OpenPlotGUI(structure);
        %  
        % <Description>
        % Creates a new instance of the plot GUI using the given problem. In the
        % plot GUI, the user can select all available time histories in the problem
        % and create plots from them.
        %  
        % <Inputs>
        % > problem: The falcon.Problem or a struct created from a problem (Using the
        % ToStruct() method) to be plotted.
        %  
        % <Keywords>
        % Problem!GUI!Open
        end

        function [cost, pointFunction] = addNewOutputCost(self, varargin)
        % 
        end

        function [cost, pointFunction] = addNewControlCost(self, varargin)
        % 
        end

        function [cost, pointFunction] = addNewStateCost(self, varargin)
        % 
        end

        function [cost, pointFunction] = addNewParameterCost(self, varargin)
        % 
        end

        function map = byNameUnique(self)
        % Get a struct for name based access to the object array, allowing
        % only unique names.
        %  
        % <Syntax>
        % [ map ] = obj.byNameUnique()
        %  
        % <Description>
        % The method returns all entries from the object array 'obj' as
        % fields of a struct, with the object Name as field name.  Throws
        % an error in case there are any duplicate names.
        %  
        % <Keywords>
        % OVC!byName!Unique
        end

        function map = byName(self)
        % Get a struct for name based access to the object array.
        %  
        % <Syntax>
        % [ map ] = obj.byName()
        %  
        % <Description>
        % The method returns all entries from the object array 'obj' as
        % fields of a struct, with the object Name as field name.  In case
        % there are duplicate names, the output struct contains object
        % arrays.
        %  
        % <Keywords>
        % OVC!byName
        end

    end

end