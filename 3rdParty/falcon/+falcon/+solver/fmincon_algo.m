classdef fmincon_algo < falcon.solver.Optimizer
    % Interface between FALCON.m and FMINCON.

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
        % The linear NLP solver used for fmincon.
        fmincon_solver
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
        function [z_opt, F_opt, status, lambda, mu] = WarmStart(obj, varargin)
        % Reuse previously calculated solutions to perform a warmstart of the solver.
        %  
        % <Syntax>
        % [z_opt, F_opt, status, lambda, mu, zl, zu] = obj.WarmStart('Name',Value)
        %  
        % <Description>
        % Solve the given optimal control problem numerically using the numerical
        % solver snopt and applying initial guesses for the Lagrange
        % multipliers.
        %  
        % <NameValue>
        % > zInitial: The initial parameter vector to start the
        % solution (default: previous optimal solution)
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
        %  
        % <Keywords>
        % Snopt!Warm Start
        end

        function [z_opt, F_opt, status, lambda, mu] = Solve(obj, varargin)
        % Solve the given optimal control problem using FMINCON
        %  
        % <Syntax>
        % [z_opt, F_opt, status, lambda, mu] = obj.Solve()
        % [z_opt, F_opt, status, lambda, mu] = obj.Solve(zInitial)
        % [z_opt, F_opt, status, lambda, mu] = obj.Solve(.., 'Name', Value)
        %  
        % <Description>
        % Solve the given optimal control problem numerically using the numerical
        % solver fmincon.
        %  
        % <Optional>
        % > zInitial: The initial parameter vector to start the solution.
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
        %  
        % <Keywords>
        % Fmincon!Solve
        end

        function obj = setFminconSolver(obj, SolverType)
        % Sets the fmincon solver type.
        %  
        % <Syntax>
        % obj.setFminconSolver(SolverType)
        %  
        % <Description>
        % Sets the fmincon solver object, i.e. the user can specify
        % the internal optimizer fmincon is using to solve the optimal
        % control problem.
        %  
        % <Inputs>
        % > SolverType: A string specifying the solver type. The
        % default one is 'interior-point'.
        %  
        % <Keywords>
        % FMINCON!Solver
        end

        function obj = fmincon_algo(varargin)
        % Constructs a falcon.solver.fmincon_algo object.
        %  
        % <Syntax>
        % obj = fmincon_algo()
        % obj = fmincon_algo(Problem)
        %  
        % <Description>
        % Creates a new fmincon interface object used to numerically solve an
        % optimal control problem. The problem can either directly be set, or can
        % later be added using the method setProblem.
        %  
        % <Inputs>
        % > Problem: The problem to be solved using this numerical solver.
        end

        function data = ParseConsoleOutput(str)
        % Extract information on the iterations of the optimization from the
        % console output created.
        % not required for fmincon but defined in the abstract class
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

        function setWarmStart(obj, flag)
        % Sets the warm start flag of the solver.
        %  
        % <Syntax>
        % obj.setWarmStart(flag)
        %  
        % <Description>
        % Enables or disables the warm start flag of the solver. 
        %  
        % <Inputs>
        % > flag: A bool representing the warm start flag
        %  
        % <Keywords>
        % Optimizer!Warm Start
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