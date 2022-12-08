classdef ipopt < falcon.solver.Optimizer
    % Interface between FALCON.m and IPOPT.

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
        % Identifier to set the mu strategy in ipopt to monotone.
        MU_STRATEGY_MONOTONE
        % Identifier to set the my strategy in ipopt to adaptive.
        MU_STRATEGY_ADAPTIVE
        % User-specified override options
        IPOPToptionsOverride
        % falcon.solver.ipopt/WarmStartBoundPush is a property.
        WarmStartBoundPush
        % falcon.solver.ipopt/WarmStartBoundFrac is a property.
        WarmStartBoundFrac
        % falcon.solver.ipopt/WarmStartSlackBoundFrac is a property.
        WarmStartSlackBoundFrac
        % falcon.solver.ipopt/WarmStartSlackBoundPush is a property.
        WarmStartSlackBoundPush
        % falcon.solver.ipopt/WarmStartMultBoundPush is a property.
        WarmStartMultBoundPush
        % falcon.solver.ipopt/WarmStartMultInitMax is a property.
        WarmStartMultInitMax
        % falcon.solver.ipopt/BoundRelaxFactor is a property.
        BoundRelaxFactor
        % falcon.solver.ipopt/mu_init is a property.
        mu_init
        % falcon.solver.ipopt/mu_target is a property.
        mu_target
        % falcon.solver.ipopt/mu_min is a property.
        mu_min
        % falcon.solver.ipopt/mu_max is a property.
        mu_max
        % falcon.solver.ipopt/mu_max_fact is a property.
        mu_max_fact
        % falcon.solver.ipopt/barrier_tol_factor is a property.
        barrier_tol_factor
        % falcon.solver.ipopt/mu_linear_decrease_factor is a property.
        mu_linear_decrease_factor
        % falcon.solver.ipopt/mu_superlinear_decrease_power is a property.
        mu_superlinear_decrease_power
        % falcon.solver.ipopt/bound_frac is a property.
        bound_frac
        % falcon.solver.ipopt/bound_push is a property.
        bound_push
        % falcon.solver.ipopt/slack_bound_frac is a property.
        slack_bound_frac
        % falcon.solver.ipopt/slack_bound_push is a property.
        slack_bound_push
        % falcon.solver.ipopt/bound_mult_init_val is a property.
        bound_mult_init_val
        % falcon.solver.ipopt/constr_mult_init_max is a property.
        constr_mult_init_max
        % falcon.solver.ipopt/bound_mult_init_method is a property.
        bound_mult_init_method
        % The linear solver used with IPOPT.
        LinearSolver
        % The mu update strategy in IPOPT. Allowed values are given in the class
        % constants MU_STRATEGY_MONOTONE and MU_STRATEGY_ADAPTIVE.
        MuStrategy
        % maximum cpu time in seconds
        MaxCPUTime
        % The number of calls of the cost function
        CallsJ
        % The number of calls of the cost function gradient
        CallsJgrad
        % The number of calls of the constraint function gradient
        CallsGgrad
        % The number of calls of the constraint function
        CallsG
        % The number of calls of the Hessian function
        CallsH
        % iteration function of user
        userIterFunc
        % falcon.solver.ipopt/UserIterFuncIgnoreErrors is a property.
        UserIterFuncIgnoreErrors
        % The problem to be solved by this solver
        Problem
        % Flag to recalculate z and f vectors
        recalcZFVec
        % Struct keeping the main optimization options, being MajorOptTol,
        % MinorOptTol, MajorFeasTol, MinorFeasTol, ComplTol, ActIdxTol, MajorIterLimit, MinorIterLimit,
        % PrintLevel, OverwriteSol, needH, MCASamples, gPCOrder, sgrule, min_apprlevel.
        Options
        % A struct holding the optimization output from snopt
        OptimizationResults
        % A struct holding the optimization output from ipopt
        output
        % If solver is in WarmStart-mode or not.
        doSolverWarmStart
    end

    methods
        function [z_opt, F_opt, status, lambda, mu, zl, zu] = WarmStart(obj, varargin)
        % Continue solving the project starting from the last iterate.
        %  
        % <Syntax>
        % [z_opt, F_opt, status, lambda, mu, zl, zu] = obj.WarmStart('Name',Value)
        %  
        % <Description>
        % Solve the given optimal control problem numerically using the numerical
        % solver ipopt. The WarmStartMode of IPOPT is not changed within this
        % function. Try changing obj.setWarmStart() to true in case you have
        % problems warm starting the solver.
        %  
        % <NameValue>
        % > zInitial: Initial guess for the optimization variables.
        % > lInitial: Initial guess for the constraint multiplier.
        % > zlInitial: Initial guess for the lower bound multiplier of
        % the optimization parameter.
        % > zuInitial: Initial guess for the upper bound multiplier of
        % the optimization parameter.
        % > zLowerBound: Lower bounds on optimization variables.
        % > zUpperBound: Upper bounds on optimization variables.
        %  
        % <Outputs>
        % > z_opt: If the problem converged, the optimal parameter vector for the
        % problem, otherwise the current iterate.
        % > F_opt: If the problem converged, the optimal constraint vector for the
        % problem, otherwise the current iterate.
        % > status: The status of the optimization. Contains the stopping criteria.
        % > lambda: If the problem converged, the optimal Lagrange multipliers for
        % the constraints of problem, otherwise the current iterate.
        % > mu: If the problem converged, the optimal Lagrange multipliers for the
        % box constraints on z of the problem, otherwise the current iterate.
        % > zl: If the problem converged, the optimal Lagrange multipliers for the
        % lower bounds of the box constraints on z of the problem, otherwise the
        % current iterate.
        % > zu: If the problem converged, the optimal Lagrange multipliers for the
        % upper bounds of the box constraints on z of the problem, otherwise the
        % current iterate.
        % > IterationFunction: The iteration function that should be
        % called in each Ipopt iteration callback specified by the
        % user. The function accepts three inputs and provides one
        % output:
        %       function b = iterfunc(nIter, f, auxdata) % b = {true, false}
        %       "Function handle of a function which is called once
        %       each NLP iteration. Its arguments are the iteration count
        %       nIter and the current objective value f. If it returns
        %       true, the optimisation is continued; if it returns false, the
        %       optimization is stopped after the current iteration."
        %  
        % <Keywords>
        % Ipopt!Warm Start
        end

        function [z_opt, F_opt, status, lambda, mu, zl, zu] = Solve(obj, varargin)
        % Solve the given optimal control problem using IPOPT
        %  
        % <Syntax>
        % [z_opt, F_opt, status, lambda, mu, zl, zu] = obj.Solve()
        % [z_opt, F_opt, status, lambda, mu, zl, zu] = obj.Solve(zInitial)
        % [z_opt, F_opt, status, lambda, mu, zl, zu] = obj.Solve(..., 'Name', Value)
        %  
        % <Description>
        % Solve the given optimal control problem numerically using the numerical
        % solver ipopt.
        %  
        % <NameValue>
        % > zInitial: The initial parameter vector to start the solution.
        % > lambda: The initial Lagrange multipliers
        % > zl: The initial multipliers for the lower constraints on the parameter
        % vector z.
        % > zu: The initial multipliers for the upper constraints on the parameter
        % vector z.
        %  
        % <Outputs>
        % > z_opt: If the problem converged, the optimal parameter vector for the
        % problem, otherwise the current iterate.
        % > F_opt: If the problem converged, the optimal constraint vector for the
        % problem, otherwise the current iterate.
        % > status: The status of the optimization. Contains the stopping criteria.
        % > lambda: If the problem converged, the optimal Lagrange multipliers for
        % the constraints of problem, otherwise the current iterate.
        % > mu: If the problem converged, the optimal Lagrange multipliers for the
        % box constraints on z of the problem, otherwise the current iterate.
        % > zl: If the problem converged, the optimal Lagrange multipliers for the
        % lower bounds of the box constraints on z of the problem, otherwise the
        % current iterate.
        % > zu: If the problem converged, the optimal Lagrange multipliers for the
        % upper bounds of the box constraints on z of the problem, otherwise the
        % current iterate.
        % > IterationFunction: The iteration function that should be
        % called in each Ipopt iteration callback specified by the
        % user. The function accepts three inputs and provides one
        % output:
        %       function b = iterfunc(nIter, f, auxdata) % b = {true, false}
        %       "Function handle of a function which is called once
        %       each NLP iteration. Its arguments are the iteration count
        %       nIter and the current objective value f. If it returns
        %       true, the optimisation is continued; if it returns false, the
        %       optimization is stopped after the current iteration."
        %  
        % <Keywords>
        % Ipopt!Solve
        end

        function self = setIterationFunction(self, varargin)
        % Specify a function that is to be executed in every iteration.
        %  
        % <Syntax>
        % self.setIterationFunction(f)
        % self.setIterationFunction(f, 'IgnoreErrors', true/false)
        %  
        % <Description>
        % The given function is executed in every NLP iteration.  By
        % default, exceptions thrown by the iteration function are ignored,
        % i.e. converted to warnings. Optionally, exceptions can be passed
        % through to the user ('IgnoreErrors', false).
        %  
        % The iteartion function must accept three inputs:
        % > nIter: current iteration number.
        % > J: current cost function value.
        % > problem: the falcon.Problem instance.
        %  
        % The iteration function provides a scalar logical output, that
        % indicates if the solver should continue (true) or stop (false).
        %  
        % <Keywords>
        % Ipopt!Settings!IterationFunction
        end

        function obj = setMaximumCPUTime(obj, Seconds)
        % Sets the maximum cpu time (seconds) for ipopt.
        % (http://www.coin-or.org/Ipopt/documentation/node42.html#SECTION000112030000000000000)
        %  
        % <Syntax>
        % obj.setMaximumCPUTime(Seconds)
        %  
        % <Description>
        % Sets the maximum cpu time in the ipopt instance used here.
        %  
        % <Inputs>
        % > Seconds: The maximum cpu time ipopt is allowed to use to
        % solve the problem. Limit is checked during conversion check.
        %  
        % <Keywords>
        % Ipopt!Settings!CPU Time
        end

        function setStandardStart(obj, varargin)
        % Sets the standard bound and push start options.
        %  
        % <Syntax>
        % obj.setStandardStart('Name',Value)
        %  
        % <Description>
        % Resets the values for the standard bound values in
        % ipopt (default values as in ipopt manual).
        %  
        % <NameValue>
        % > bound_frac: Desired minimum absolute distance from the
        % initial point to bound (together with "bound push").
        % > bound_push: Desired minimum absolute distance from the
        % initial point to bound (together with "bound frac").
        % > slack_bound_frac: Desired minimum relative distance from
        % the initial slack to bound(together with "slack bound push").
        % > slack_bound_push: Desired minimum relative distance from
        % the initial slack to bound(together with "slack bound frac").
        % > bound_mult_init_val:Initial value for the bound
        % multipliers.
        % > constr_mult_init_max:Maximum allowed least-square guess of
        % constraint multipliers.
        % > bound_mult_init_method: Initialization method for bound
        % multipliers.
        %  
        % <Keywords>
        % Ipopt!Standard Start
        end

        function setWarmStart(obj, flag, varargin)
        % Sets the warm start feature of ipopt.
        %  
        % <Syntax>
        % obj.setWarmStart(flag, 'Name',Value)
        %  
        % <Description>
        % Enables or disables the warm start feature of IPOPT. Sets the
        % flag to specify warm start bounds and relaxation.
        %  
        % <Inputs>
        % > flag: A bool, enabling or disabling the warmstart feature of
        % IPOPT.
        %  
        % <NameValue>
        % > WarmStartBoundPush: same as bound push for the regular initializer.
        % > WarmStartBoundFrac: same as bound frac for the regular initializer.
        % > WarmStartSlackBoundFrac: same as slack bound frac for the regular initializer.
        % > WarmStartSlackBoundPush: same as slack bound push for the regular initializer.
        % > WarmStartMultBoundPush: same as mult bound push for the regular initializer.
        % > WarmStartMultInitMax: Maximum initial value for the equality multipliers.
        % > BoundRelaxFactor: Factor for initial relaxation of the bounds.
        % > mu_init: Initial value for the barrier parameter.
        %  
        % <Keywords>
        % Ipopt!Warm Start
        end

        function setLinearSolver(obj, LinSolver)
        % Sets the linear solver used in ipopt.
        %  
        % <Syntax>
        % obj.setLinearSolver(LinSolver)
        %  
        % <Description>
        % Sets the linear solver used by ipopt to solve the NLP.
        %  
        % <Inputs>
        % > LinSolver: A char specifiying the linear solver. The
        % default is ma57.
        %  
        % <Keywords>
        % Ipopt!Settings!Linear Solver
        end

        function setMuSuperLinearDecreaseFactor(obj, Value)
        % Determines superlinear decrease rate of barrier parameter.
        %  
        % <Syntax>
        % obj.setMuSuperLinearDecreaseFactor(Value)
        %  
        % <Description>
        % For the Fiacco-McCormick update procedure the new barrier
        % parameter mu is obtained by taking the minimum of mu times
        % "mu linear decrease factor" and mu"superlinear decrease power".
        % (This is theta mu in implementation paper.) This option is
        % also used in the adaptive mu strategy during the monotone mode.
        % The valid range for this real option is
        % 1 < mu superlinear decrease power < 2 and its default value
        % is 1.5.
        %  
        % <Inputs>
        % > Value: The numerical superlinear barrier decrease value
        %  
        % <Keywords>
        % Ipopt!Settings!Mu Superlinear Decrease
        end

        function setMuLinearDecreaseFactor(obj, Value)
        % Determines linear decrease rate of barrier parameter.
        %  
        % <Syntax>
        % obj.setMuLinearDecreaseFactor(Value)
        %  
        % <Description>
        % For the Fiacco-McCormick update procedure the new barrier
        % parameter mu is obtained by taking the minimum of mu times
        % "mu linear decrease factor" and mu"superlinear decrease power".
        % (This is kappa mu in implementation paper.) This option is also
        % used in the adaptive mu strategy during the monotone mode.
        % The valid range for this real option is 0 <
        % mu linear decrease factor < 1 and its default value is 0.2.
        %  
        % <Inputs>
        % > Value: The numerical linear barrier decrease value
        %  
        % <Keywords>
        % Ipopt!Settings!Mu Linear Decrease
        end

        function setBarrierTolFactor(obj, Value)
        % Factor for mu in barrier stop test.
        %  
        % <Syntax>
        % obj.setBarrierTolFactor(Value)
        %  
        % <Description>
        % The convergence tolerance for each barrier problem in the
        % monotone mode is the value of the barrier parameter times
        % "barrier tol factor". This option is also used in the adaptive
        % mu strategy during the monotone mode. (This is kappa epsilon
        % in implementation paper). The valid range for this real option
        % is 0 < barrier tol factor < inf and its default value is 10.
        %  
        % <Inputs>
        % > Value: The numerical barrier tolerance factor value
        %  
        % <Keywords>
        % Ipopt!Settings!Mu Barrier Tolerance
        end

        function setMuMaxFact(obj, Value)
        % Factor for initialization of maximum value for barrier parameter.
        %  
        % <Syntax>
        % obj.setMuMaxFact(Value)
        %  
        % <Description>
        % This option determines the upper bound on the barrier parameter.
        % This upper bound is computed as the average complementarity at
        % the initial point times the value of this option. (Only used
        % if option "mu strategy" is chosen as "adaptive".) The valid
        % range for this real option is 0 < mu max fact < inf and its
        % default value is 1000.
        %  
        % <Inputs>
        % > Value: The numerical maximum factor value
        %  
        % <Keywords>
        % Ipopt!Settings!Mu Maximum Factor
        end

        function setMuMax(obj, Value)
        % Sets the maximum mu value.
        %  
        % <Syntax>
        % obj.setMuMax(Value)
        %  
        % <Description>
        % Sets the maximum mu value, i.e., the upper bound of the
        % barrier parameter (mainly for adaptive strategies)
        %  
        % <Inputs>
        % > Value: The numerical maximum value
        %  
        % <Keywords>
        % Ipopt!Settings!Mu Maximum
        end

        function setMuMin(obj, Value)
        % Sets the minimum mu value.
        %  
        % <Syntax>
        % obj.setMuMin(Value)
        %  
        % <Description>
        % Sets the minimum mu value, i.e., the lower bound of the
        % barrier parameter (mainly for adaptive strategies)
        %  
        % <Inputs>
        % > Value: The numerical minimum value
        %  
        % <Keywords>
        % Ipopt!Settings!Mu Minimum
        end

        function setMuInit(obj, Target)
        % Sets the initial mu value.
        %  
        % <Syntax>
        % obj.setMuInit(Target)
        %  
        % <Description>
        % Sets the initial mu value, i.e., the iteration start point.
        %  
        % <Inputs>
        % > Target: The numerical initial value
        %  
        % <Keywords>
        % Ipopt!Settings!Mu Initial
        end

        function setMuTarget(obj, Target)
        % Sets the mu target value.
        %  
        % <Syntax>
        % obj.setMuTarget(Target)
        %  
        % <Description>
        % Sets the mu target value, i.e., the value of that defines to
        % which extend the complementary slackness conditions must be
        % fulfilled to view a constraint as "fulfilled". A larger value
        % leads to an easier to solve problem, but might be unphysical.
        %  
        % <Inputs>
        % > Target: The numerical target value
        %  
        % <Keywords>
        % Ipopt!Settings!Mu Target
        end

        function setMuStrategy(obj, opt)
        % Sets the mu update strategy used in ipopt.
        %  
        % <Syntax>
        % obj.setMuStrategy(Strategy)
        %  
        % <Description>
        % Sets the mu update strategy in the ipopt instance used here.
        %  
        % <Inputs>
        % > Strategy: The mu update strategy to be used for solving the problem.
        % Supported values can be found in the constants MU_STRATEGY_MONOTONE and
        % MU_STRATEGY_ADAPTIVE in this class.
        %  
        % <Keywords>
        % Ipopt!Settings!Mu Strategy
        end

        function obj = ipopt(varargin)
        % Constructs a falcon.solver.ipopt object.
        %  
        % <Syntax>
        % obj = ipopt()
        % obj = ipopt(Problem)
        %  
        % <Description>
        % Creates a new ipopt interface object used to numerically solve an
        % optimal control problem. The problem can either directly be set, or can
        % later be added using the method setProblem.
        %  
        % <Inputs>
        % > Problem: The problem to be solved using this numerical solver.
        %  
        % <Keywords>
        % Constructor!Ipopt
        end

        function flag = isLinearSolverAvailable(~, name)
        % Check if a given linear solver is availabe in the active IPopt
        % distribution by calling ipopt on a trivial sample problem.
        end

        function availableSolvers = getPreferredLinearSolversAvailable(self)
        % Identify which linear solvers from a list of known solvers are
        % available in the active IPopt distribution.
        end

        function chooseLinearSolver(self)
        % set default linear solver according to user preferences and
        % solver availability
        end

        function data = ParseConsoleOutput(str)
        % Extract information on the iterations of the optimization from the
        % console output created.
        %  
        % <Syntax>
        % data = falcon.solver.ipopt.ParseConsoleOutput(str)
        %  
        % <Description>
        % Parse the console output created by the optimization and automatically
        % analyze it. The resulting data on the iteration history is returned in a
        % struct.
        %  
        % <Outputs>
        % > data: The data struct containing information about the iteration
        % history while solving the problem.
        %  
        % <Keywords>
        % Ipopt!Parser
        end

        function AnalyzeSolverResult(obj, varargin)
        % Make some analysis on the (optimal) solver results.
        %  
        % <Syntax>
        % obj.AnalyzeSolverResult()
        %  
        % <Description>
        % This function makes some analysis on the (optimal) results from
        % the solver. It specifically checks KKT conditions, constraint
        % fulfillment, scalings,...
        %  
        % <NameValue>
        % > checkGradient: Makes a gradient check by comparison to
        % finite differences (default: false).
        % > checkScaling: Makes a scaling check (default: false).
        % > doSimulation: Simulate the problem with the optimal control
        % history and find e.g., numerical instabilities or stiff
        % integrations (default: false).
        %  
        % <Keywords>
        % Optimizer!Checks!Analyze
        end

        function dLdz = CheckKKT(obj, varargin)
        % Check the KKT conditions of the problem.
        %  
        % <Syntax>
        % dLdz = obj.CheckKKT()
        % dLdz = obj.CheckKKT('Name', Value)
        %  
        % <Description>
        % Calculate the Jacobian of the Lagrange function and extract the largest
        % value. This is an approximate KKT condition check.
        %  
        % <NameValue>
        % > lambda: The multipliers for the constraints f in the problem. (default:
        % the values from the optimal solution, if the problem was already solved.)
        % > zl: The multipliers for the lower bounds of z. (default: the values
        % from the optimal solution, if the problem was already solved.)
        % > zu: The multipliers for the upper bounds of z. (default: the values
        % from the optimal solution, if the problem was already solved.)
        % > mu: The combined multipliers for the bounds of z: mu = -zl + zu.
        % (default: the values from the optimal solution, if the problem was
        % already solved.)
        %  
        % <Outputs>
        % > dLdz: The Jacobian of the Lagrange function with respect to the
        % parameter vector z.
        %  
        % <Keywords>
        % Optimizer!Checks!KKT
        end

        function setFlagRecalculcZFVec(obj, flag)
        % Set the flag to recalculate the optimization parameter and
        % residual vector.
        %  
        % <Syntax>
        % obj.setFlagRecalculcZFVec(flag)
        %  
        % <Description>
        % When the flag is true, the z and f vectors are recalculated
        % each time the solve command is invoked. This allows fast
        % initial guess studies or different bounds. It should be noted
        % that the general problem is not allowed to change.
        %  
        % <Inputs>
        % > flag: Flag to recalculate z and f vector (default: false).
        %  
        % <Keywords>
        % Optimizer!RecalcZFFlag
        end

        function obj = setProblem(obj, problem)
        % Set the problem to be solved.
        %  
        % <Syntax>
        % obj.setProblem(Problem)
        %  
        % <Description>
        % Sets the optimal control problem to be numerically solved using this
        % solver.
        %  
        % <Inputs>
        % > Problem: The problem to be solved using this numerical solver.
        %  
        % <Keywords>
        % Optimizer!Problem
        end

    end

end