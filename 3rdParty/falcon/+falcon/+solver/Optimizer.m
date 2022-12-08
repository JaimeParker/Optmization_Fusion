classdef (Abstract) Optimizer < falcon.core.Handle
    % The abstract base class representing the numerical solver interface for FALCON.m.

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

        function obj = Optimizer(varargin)
        % Constructs a falcon.solver.Optimizer object.
        %  
        % <Syntax>
        % obj = Optimizer()
        % obj = Optimizer(Problem)
        %  
        % <Description>
        % Creates a new FALCON.m optimizer used to numerically solve an
        % optimal control problem. The problem can either directly be set, or can
        % later be added using the method setProblem.
        %  
        % <Inputs>
        % > Problem: The problem to be solved using this numerical solver.
        %  
        % <Keywords>
        % Constructor!Optimizer
        end

        function Solve(obj)
        % falcon.solver.Optimizer/Solve is a function.
        %   obj = falcon.solver.Optimizer
        end

        function data = ParseConsoleOutput(str)
        % falcon.solver.Optimizer.ParseConsoleOutput is a function.
        %   obj = falcon.solver.Optimizer.ParseConsoleOutput
        end

    end

end