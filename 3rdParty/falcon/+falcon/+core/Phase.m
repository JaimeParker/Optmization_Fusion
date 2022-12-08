classdef Phase < falcon.core.Handle & falcon.core.HasToStruct & falcon.core.HasProblem
    % Container for a phases of an optimal control problem

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
        % The number of this phase. Unique phase identifier.
        PhaseNumber
        % State grid of this phase (falcon.core.Grid)
        StateGrid
        % Array of Control grids of this phase (falcon.core.Grid)
        ControlGrids
        % The grid holding the state defects in this phase
        DefectGrid
        % The grid holding the costates
        CostateGrid
        % Path Functions store fPathfunction which limit for instance a
        % state over the whole phase
        PathConstraintFunctions
        % Lagrange cost functions store fPathfunction which are added to the
        % overall vost of this problem
        LagrangeCostFunctions
        % Model calculate the dynamics either by using
        Model
        % The real start time of this phase (The normalized time always
        % runs from 0 to 1, while the realtime runs from StartTime to
        % FinalTime).
        StartTime
        % The real final time of this phase (The normalized time always
        % runs from 0 to 1, while the realtime runs from StartTime to
        % FinalTime).
        FinalTime
        % The initial boundary values for the states of this phase
        InitialBoundaries
        % The final boundary values for the states of this phase
        FinalBoundaries
        % Parameter boundaries
        ParameterInitialBoundaries
        % falcon.core.Phase/ParameterFinalBoundaries is a property.
        ParameterFinalBoundaries
        % The interpolated values of the control grids w.r.t the state
        % grid normalized time
        InterpolatedControlGrid
        % The grid holding the post processed values of this phase.
        PostProcessedGrid
        % The grid holding the simulated states (post-processed) of this phase.
        SimulatedStateGrid
        % Next Phase to which the phase defect is constructed
        ConnectedNextPhase
        % Connected states, for which phase defect is constructed
        ConnectedStates
        % Start z index of phase
        zIndexStart
        % Start f index of phase
        fIndexStart
        % falcon.core.Phase/PhaseExtensions is a property.
        PhaseExtensions
        % (dependent) All combined DataTypes of the controls
        ControlDataTypes
        % (dependent) Real time vector of the grid
        RealTime
        % falcon.core.Phase/Duration is a property.
        Duration
        % <sensitive>
        DurationSensitivity
        % <sensitive>
        RealTimeSensitivity
    end

    methods
        function resampleStates(self, newNormalizedTime)
        % Resample the StateGrid and associated grids.
        %  
        % <Syntax>
        % phase.resampleStates(newNormalizedTime)
        %  
        % <Description>
        % Updates the normalized time vector of all state-associated grids
        % in the Phase.  Grid values are interpolated.
        %  
        % <Keywords>
        % Phase!StateGrid!Resample
        end

        function setFinalTime(obj, finalTime)
        % Sets the FinalTime of this grid.
        %  
        % <Syntax>
        % obj.setFinalTime(finalTime)
        %  
        % <Description>
        % Uses the given FinalTime as the final time of this grid in real time.
        %  
        % <Inputs>
        % > finalTime: Either an falcon.Parameter or a scalar numeric value used as the
        % final time for this grid.
        %  
        % <Keywords>
        % Phase!Duration!Final Time
        end

        function setStartTime(obj, startTime)
        % Sets the StartTime of this grid.
        %  
        % <Syntax>
        % obj.setStartTime(StartTime)
        %  
        % <Description>
        % Uses the given StartTime as the start time of this grid in real time.
        %  
        % <Inputs>
        % > StartTime: Either an falcon.Parameter or a scalar numeric value used as the
        % initial time (start time) for this grid.
        %  
        % <Keywords>
        % Phase!Duration!Start Time
        end

        function addPostProcessingStep(obj, func, inargscell, calcValues)
        % Add a post processing step to be performed after the problem has been
        % solved.
        %  
        % <Description>
        % Add a post processing step to be performed after the problem has been
        % solved. The post-processing is always applied to the full
        % time interval and may differ for different phases. Thus, it must support
        % element-wise operations.
        %  
        % <Syntax>
        % obj.addPostProcessingStep(func, inargscell, calcValues)
        %  
        % <Required>
        % >func: Function handle (anonymous and standard) with multiple
        % inputs and a single output calculating the post-processing
        % value.
        % >inargscell: Cell array containing the function input
        % arguments (in correct order) that are required to calculate
        % the post-processing value. All falcon objects can be used as
        % inputs including already calculated post-processed values.
        % >calcValues: A falcon.Value object containg the name of the
        % post-processed value as saved in the PostProcessedGrid of
        % the phase.
        %  
        % <Keywords>
        % Phase!Post Process!Add
        end

        function addPhaseExtension(obj, extension)
        % <Keywords>
        % Phase!Extension
        end

        function strc = ToStruct(obj, varargin)
        % Create a struct of the falcon.core.Phase-object.
        %  
        % <Syntax>
        % strc = obj.ToStruct()
        %  
        % <Description>
        % This metod creates a struct of the falcon.core.Phase-object
        % including all the necessary information of the phase.
        %  
        % <Inputs>
        % >obj: falcon.core.Phase-object to be transformed in a struct.
        %  
        % <NameValue>
        % >DebugData: Setting this option to true enables debug data in
        %   the ToStruct method.
        %  
        % <Outputs>
        % >strc: struct containing the inherent properties of the falcon.core.Phase-object
        %  
        % <Keywords>
        % Debugging!Phase
        end

        function setFinalBoundaries(obj, varargin)
        % Sets the final boundary conditions for the states of this phase.
        %  
        % <Syntax>
        % obj.setFinalBoundaries(EqualityBoundaries)
        % obj.setFinalBoundaries(LowerBounds, UpperBounds)
        % obj.setFinalBoundaries(falcon.State, EqualityBoundary)
        % obj.setFinalBoundaries(falcon.State, LowerBounds, UpperBounds)
        %  
        % <Description>
        % Sets the final boundary conditions of the states to the
        % provided values. There are several possibilities to set the boundary
        % conditions for the states of this phase depending of the
        % number and type of function arguments used for the call.
        % Please note that this function may be called more than once.
        % Each time this function is called the newly specified values
        % are overwritten but conserving already set values!
        % > Case I: One function argument - numeric, real valued column vector with
        % number of entries equal to the number of states in the phase.
        % The lower and upper bounds are set to the same value
        % specified in the column vector.
        % > Case II: Two function arguments - The first argument is an column vector of falcon.State objects.
        % The second argument is a numeric, real valued column vector with the number of
        % entries equal to the number of falcon.State objects in the first argument.
        % The lower and upper bounds for the falcon.State objects are set
        % to the same value specified in the column vector.
        % > Case III: Two function arguments - The first argument is a numeric,
        % real valued column vector specifying the lower bounds of the final boundary condition.
        % The second argument is a numeric, real valued column vector
        % specifying the upper bounds, respectively. Please note that the number of entries in the
        % column vector for the lower and upper bounds have to be equal to the
        % number of states in this phase. The boundaries are set according to the entries
        % in the two column vectors.
        % > Case IV: Three function arguments - The first argument is an column vector of falcon.State objects.
        % The second argument is a numeric, real valued column vector with the number of
        % entries equal to the number of falcon.State objects in the first argument and
        % specifies the lower bounds for these states.
        % The third argument is a numeric, real valued column vector with
        % the number of entries equal to the number of falcon.State objects
        % in the first argument and specifies the upper bounds for these states.
        %  
        %  
        % <Inputs>
        % > EqualityBoundaries: A vector of the same size as the state vector for this
        % phase that contains the values for the final boundary conditon.
        % Lower and upper bounds are set to the same value specified in the array. If
        % the vector contains inf or - inf values, these are ignored and replaced
        % by the regular boundaries for the states.
        % > LowerBounds: A vector of the same size as the state vector for this
        % pase that contains the lower boundaries for the final state values. If
        % the vector contains -inf values, these are ignored and replaced by the
        % regular boundaries for the states.
        % > UpperBounds: A vector of the same size as the state vector for this
        % phase that contains the upper boundaries for the final state values. If
        % the vector contains inf values, these are ignored and replaced by the
        % regular boundaries for the states.
        %  
        % <Keywords>
        % Phase!Boundaries!Final
        end

        function addNewParameterFinalBoundaries(obj, states, parameters)
        % Sets parameter dependent initial boundary conditions for the states of this phase
        % <Syntax>
        % obj.addNewParameterInitialBoundaries(falcon.State, falcon.Parameter)
        %  
        % <Description>
        % Set final boundary conditions for the states such that they match the values of the parameters.
        %  
        %  
        % <Inputs>
        % > States: A vector of falcon.State objects containing the all states the parameterized
        % boundary conditions should apply to
        end

        function addNewParameterInitialBoundaries(obj, states, parameters)
        % Sets parameter dependent initial boundary conditions for the states of this phase
        % <Syntax>
        % obj.addNewParameterInitialBoundaries(falcon.State, falcon.Parameter)
        %  
        % <Description>
        % Set final boundary conditions for the states such that they match the values of the parameters.
        %  
        %  
        % <Inputs>
        % > States: A vector of falcon.State objects containing the all states the parameterized
        % boundary conditions should apply to
        end

        function setInitialBoundaries(obj, varargin)
        % Sets the initial boundary conditions for the states of this phase.
        %  
        % <Syntax>
        % obj.setInitialBoundaries(EqualityBoundaries)
        % obj.setInitialBoundaries(LowerBounds, UpperBounds)
        % obj.setInitialBoundaries(falcon.State, EqualityBoundary)
        % obj.setInitialBoundaries(falcon.State, LowerBounds, UpperBounds)
        %  
        % <Description>
        % Sets the initial boundary conditions of the states to the
        % provided values. There are several possibilities to set the boundary
        % conditions for the states of this phase depending of the
        % number and type of function arguments used for the call.
        % Please note that this function may be called more than once.
        % Each time this function is called the newly specified values
        % are overwritten but conserving already set values!
        % > Case I: One function argument - numeric, real valued column vector with
        % number of entries equal to the number of states in the phase.
        % The lower and upper bounds are set to the same value
        % specified in the column vector.
        % > Case II: Two function arguments - The first argument is an column vector of falcon.State objects.
        % The second argument is a numeric, real valued column vector with the number of
        % entries equal to the number of falcon.State objects in the first argument.
        % The lower and upper bounds for the falcon.State objects are set
        % to the same value specified in the column vector.
        % > Case III: Two function arguments - The first argument is a numeric,
        % real valued column vector specifying the lower bounds of the final boundary condition.
        % The second argument is a numeric, real valued column vector
        % specifying the upper bounds, respectively. Please note that the number of entries in the
        % column vector for the lower and upper bounds have to be equal to the
        % number of states in this phase. The boundaries are set according to the entries
        % in the two column vectors.
        % > Case IV: Three function arguments - The first argument is an column vector of falcon.State objects.
        % The second argument is a numeric, real valued column vector with the number of
        % entries equal to the number of falcon.State objects in the first argument and
        % specifies the lower bounds for these states.
        % The third argument is a numeric, real valued column vector with
        % the number of entries equal to the number of falcon.State objects
        % in the first argument and specifies the upper bounds for these states.
        %  
        %  
        % <Inputs>
        % > EqualityBoundaries: A vector of the same size as the state vector for this
        % phase that contains the values for the initial boundary conditon.
        % Lower and upper bounds are set to the same value specified in the array. If
        % the vector contains inf or - inf values, these are ignored and replaced
        % by the regular boundaries for the states.
        % > LowerBounds: A vector of the same size as the state vector for this
        % pase that contains the lower boundaries for the final state values. If
        % the vector contains -inf values, these are ignored and replaced by the
        % regular boundaries for the states.
        % > UpperBounds: A vector of the same size as the state vector for this
        % phase that contains the upper boundaries for the final state values. If
        % the vector contains inf values, these are ignored and replaced by the
        % regular boundaries for the states.
        %  
        % <Keywords>
        % Phase!Boundaries!Initial
        end

        function [simTimeStates, simTimeOutputs, simTime, simTimeStatesDot] = SimulatePhase(obj, varargin)
        % Integrate the optimized trajectory using standard matlab
        % solvers. The result will be a forward simulation of phase.
        %  
        % <Syntax>
        % [states,outputs,time,statesDot] = obj.SimulatePhase()
        % [states,outputs,time,statesDot] = obj.SimulatePhase(init_states)
        % [states,outputs,time,statesDot] = obj.SimulatePhase(init_states,control_history)
        % [states,outputs,time,statesDot] = obj.SimulatePhase(init_states,control_history,ode_solver)
        % [states,outputs,time,statesDot] = obj.SimulatePhase(init_states,control_history,ode_solver,ode_options)
        % [states,outputs,time,statesDot] = obj.SimulatePhase(init_states,control_history,ode_solver,ode_options,UseRealTime)
        % [states,outputs,time,statesDot] = obj.SimulatePhase(init_states,control_history,ode_solver,ode_options,UseRealTime,SplitIntervals)
        % [states,outputs,time,statesDot] = obj.SimulatePhase(init_states,control_history,ode_solver,ode_options,UseRealTime,SplitIntervals,UseODETimeStep)
        % [states,outputs,time,statesDot] = obj.SimulatePhase(init_states,control_history,ode_solver,ode_options,UseRealTime,SplitIntervals,UseODETimeStep,UseBackwardInt)
        % [states,outputs,time,statesDot] = obj.SimulatePhase(init_states,control_history,ode_solver,ode_options,UseRealTime,SplitIntervals,UseODETimeStep,UseBackwardInt,DoVisualization)
        % [states,outputs,time,statesDot] = obj.SimulatePhase(init_states,control_history,ode_solver,ode_options,UseRealTime,SplitIntervals,UseODETimeStep,UseBackwardInt,DoVisualization,DoSensitivity)
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
        % > states: Simulated states with the initial condition and
        % controls from the object.
        % > outputs: Simulated outputs with the initial condition and
        % controls from the object.
        % > time: The time grid the integration is carried out.
        % > statesDot: Simulated state derivatives with the initial
        % condition and controls from the object.
        %  
        % <Keywords>
        % Phase!Simulate; Problem!Simulate!Phase
        end

        function setDurationLimit(obj, DurationLowerBound, DurationUpperBound, varargin)
        % Sets the limits of the duration of this Phase.
        %  
        % <Syntax>
        % obj.setDurationLimit(DurationLowerBound, DurationUpperBound)
        % obj.setDurationLimit(DurationLowerBound, DurationUpperBound, 'Name', Value)
        %  
        % <Description>
        % Set the scalar, real valued limits of the duration of this phase.
        % Please note that the lower bound of the phase duration must be smaller
        % than the upper bound.
        %  
        % <Inputs>
        % > DurationLowerBound: Lower bound of the duration of this phase.
        % > DurationUpperBound: Upper bound of the duration of this phase.
        %  
        % <NameValue>
        % > Offset: The offset of the phase duration value.
        % (default: 0)
        % > Scaling: The scaling of the phase duration value.
        % (default: Scaling of the final time - parameter of this phase)
        %  
        % <Keywords>
        % Phase!Duration!Limit
        end

        function nextPhase = ConnectToNextPhase(obj, nextPhase)
        % <Keywords>
        % Phase!Connect
        end

        function [cost, pathFunction] = addNewQuadraticPathCost(self, variables, varargin)
        % Minimize (default) or maximize the integral of a quadratic form.
        %  
        % <Syntax>
        % phase.addNewQuadraticPathCost(variables)
        % phase.addNewQuadraticPathCost(variables, NormalizedTime)
        % phase.addNewQuadraticPathCost(..., 'Name', Value)
        %  
        % <Description>
        % Add a quadratic path cost function  of the form
        %   0.5 * integral( (v - v0)' * W * (v - v0) )
        % with a vector of variables v (including States, Controls,
        % Parameters and Outputs in arbitrary order), offset vector v0 and
        % weight matrix W.
        %  
        % <Inputs>
        % > variables: The vector of variables v.
        % > NormalizedTime: The integration grid.
        %   Defaults to the state discretization.
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
        % > Cost: A falcon.Cost object.  Default autogenerated.
        %  
        % <Outputs>
        % > cost: falcon.Cost
        % > pathFunction: falcon.core.PathFunction
        %  
        % <Keywords>
        % Phase!Cost!Quadratic
        end

        function [cost, pathFunction] = addNewLinearPathCost(self, variables, varargin)
        % Minimize (default) or maximize the integral of a linear function.
        %  
        % <Syntax>
        % phase.addNewLinearPathCost(variables)
        % phase.addNewLinearPathCost(variables, NormalizedTime)
        % phase.addNewLinearPathCost(..., 'Name', Value)
        %  
        % <Description>
        % Add a linear path cost function of the form
        %   integral( w' * (v - v0) )
        % with a vector of variables v (including States, Controls,
        % Parameters and Outputs in arbitrary order), offset vector v0 and
        % weight vector w.
        %  
        % <Inputs>
        % > variables: The vector of variables v.
        % > NormalizedTime: The integration grid.
        %   Defaults to the state discretization.
        %  
        % <NameValue>
        % > Weight: The weights corresponding to v, specified either as a
        %   column vector w of constant weights, or a matrix with varying
        %   weights, W = [w[1] ... w[N]].
        %   Defaults to one.
        % > Offset: The offsets corresponding to v, specified either as a
        %   column vector v0 with constant offsets, or a matrix with
        %   varying offsets, V0 = [v0[1] ... v0[N]].
        %   Defaults to zero.
        % > Cost: A falcon.Cost object.  Default autogenerated.
        %  
        % <Outputs>
        % > cost: falcon.Cost
        % > pathFunction: falcon.core.PathFunction
        %  
        % <Keywords>
        % Phase!Cost!Linear
        end

        function lagrangeFunction = addNewLagrangeCost(obj, functionHandle, cost, normalizedTime)
        % Adds a new Lagrange cost function to the list of cost functions of this
        % phase.
        %  
        % <Syntax>
        % lagrangeFunction = obj.addNewLagrangeCost(functionHandle, cost)
        % lagrangeFunction = obj.addNewLagrangeCost(functionHandle, cost, normalizedTime)
        %  
        % <Description>
        % Creates a new Lagrange cost function based on the provided function handle,
        % constraints and normalized time. The function is
        % added to the list of path functions of this phase and is
        % returned. If no normalized time is specified the
        % state-grid discretization is used.
        %  
        % <Inputs>
        % > functionHandle: The function handle to the function used to calculate
        % this Lagrange cost. For more information on the function handle see see
        % falcon.PathFunction or falcon.PathConstraintBuilder. If not specified via a
        % path constraint builder file, the function handle must
        % fulfill the following header convention (if in doubt, please let
        % Falcon.m create the function interface for you):
        %   cost = functionHandle(outputs, states, controls, parameters);
        %   cost: a scalar cost value
        %   outputs: column vector of outputs, if the model has some
        %   (otherwise this input is omitted)
        %   states: column vector of states
        %   controls: column vector of controls, if the model has some
        %   (otherwise this input is omitted)
        %   parameters: column vector of parameters, that were set by
        %   setParameters method (otherwise the input is omitted)
        % > cost: A vector of falcon.Cost objects defining the output of this cost
        % function. The size of the vector has to fit the outputs of the function.
        % > normalizedTime: The points in normalized time to evaluate the path
        % function on.  If no normalized time is  specified the StateGrid
        % discretization is used.
        %  
        % <Outputs>
        % >lagrangeFunction: Lagrange-function object.
        %  
        % <Keywords>
        % Phase!Lagrange Cost; Path Function!Phase Cost
        end

        function pathFunction = addNewPathConstraint(obj, functionHandle, constraints, normalizedTime)
        % Adds a new path function to the list of path functions of this phase.
        %  
        % <Syntax>
        % pathFunction = obj.addNewPathConstraint(functionHandle, constraints)
        % pathFunction = obj.addNewPathConstraint(functionHandle, constraints, normalizedTime)
        %  
        % <Description>
        % Creates a new path function based on the provided function handle,
        % constraints and normalized time. The function is
        % added to the list of path functions of this phase and is
        % returned. If no normalized time is specified the
        % state-grid discretization is used.
        %  
        % <Inputs>
        % > functionHandle: The function handle to the function used to calculate
        % this path constraint. For more information on the function handle see
        % falcon.PathFunction or falcon.PathConstraintBuilder. If not specified via a
        % path constraint builder file, the function handle must
        % fulfill the following header convention (if in doubt, please let
        % Falcon.m create the function interface for you):
        %   constraints = functionHandle(outputs, states, controls, parameters);
        %   constraints: column vector of constraints
        %   outputs: column vector of outputs, if the model has some
        %   (otherwise this input is omitted)
        %   states: column vector of states
        %   controls: column vector of controls, if the model has some
        %   (otherwise this input is omitted)
        %   parameters: column vector of parameters, that were set by
        %   setParameters method (otherwise the input is omitted)
        % > constraints: A vector of falcon.Constraint objects defining the boundaries,
        % the scaling etc. of the values calculated by this path function. The size
        % of the vector has to fit the outputs of the function.
        % > normalizedTime: The points in normalized time to evaluate the path
        % function on. If no normalized time is  specified the StateGrid
        % discretization is used.
        %  
        % <Outputs>
        % > pathFunction: Path-function object.
        %  
        % <Keywords>
        % Phase!Path Constraint; Path Function!Phase Constraint
        end

        function controlGrid = addNewControlGrid(obj, controls, normalizedTime)
        % Adds a new control grid to the list of control grids of this phase.
        %  
        % <Syntax>
        % controlGrid = obj.addNewControlGrid(controls)
        % controlGrid = obj.addNewControlGrid(controls, normalizedTime)
        %  
        % <Description>
        % Creates a new control grid of type falcon.core.Grid based on the given normalized
        % time and the given controls, adds it to the list of control grids of this
        % phase and returns it. If no normalized time is specified the
        % state-grid discretization is used.
        %  
        % <Inputs>
        % > controls: A vector of falcon.Control objects defining the controls to be used
        % on this control grid.
        % > normalizedTime: The points in normalized time where the control
        % values are defined. If no normalized time is specified the
        % state-grid discretization is used.
        %  
        % <Outputs>
        % > controlGrid: Control-grid object.
        %  
        % <Keywords>
        % Phase!Grid!Control
        end

    end

end