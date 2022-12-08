classdef snopt < falcon.solver.Optimizer
    % Interface to SNOPT from FALCON.m.
    % METHODS

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
        % > xmul: Lagrange multipliers for the optimization
        % parameters (default: previous optimal solution)
        % > Fmul: Lagrange multipliers for the residuals
        % (default: previous optimal solution)
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
        % Solve the given optimal control problem using SNOPT
        %  
        % <Syntax>
        % [z_opt, F_opt, status, lambda, mu, zl, zu] = obj.Solve()
        % [z_opt, F_opt, status, lambda, mu, zl, zu] = obj.Solve(zInitial)
        % [z_opt, F_opt, status, lambda, mu, zl, zu] = obj.Solve(zInitial,xmul,Fmul)
        %  
        % <Description>
        % Solve the given optimal control problem numerically using the numerical
        % solver snopt.
        %  
        % <NameValue>
        % > zInitial: The initial parameter vector to start the solution.
        % > xmul: Lagrange multipliers for the optimization parameters.
        % > Fmul: Lagrange multipliers for the residuals.
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
        % Snopt!Solve
        end

        function obj = snopt(varargin)
        % Constructs a falcon.solver.snopt object.
        %  
        % <Syntax>
        % obj = snopt()
        % obj = snopt(Problem)
        %  
        % <Description>
        % Creates a new snopt interface object used to numerically solve an
        % optimal control problem. The problem can either directly be set, or can
        % later be added using the method setProblem.
        %  
        % <Inputs>
        % > Problem: The problem to be solved using this numerical solver.
        %  
        % <Keywords>
        % Constructor!Snopt
        end

        function data = ParseConsoleOutput(str)
        % falcon.solver.snopt.ParseConsoleOutput is a function.
        %   data = falcon.solver.snopt.ParseConsoleOutput(str)
        end

        function ApplySNOPTSettings(varargin)
        % Apply the given setting to SNOPT.
        %  
        % <Syntax>
        % obj.ApplySNOPTSettings('Name', Value)
        %  
        % <Description>
        % Apply the settings from the SNOPT manual directly to SNOPT. This method
        % uses the snset methods to change the SNOPT behavior globally.
        %  
        % <NameValue>
        % > NameValue: Settings of SNOPT as mentioned in the manual.
        %  
        % <Keywords>
        % Snopt!Settings
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