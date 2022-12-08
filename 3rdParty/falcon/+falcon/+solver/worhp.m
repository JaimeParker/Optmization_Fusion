classdef worhp < falcon.solver.Optimizer
    % Interface to WORHP from FALCON.m.

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
        % WORHP internal parameters
        params
        % maximum cpu time (i.e., timeout)
        MaxCPUTime
        % license path
        licPath
        % license name
        licName
        % flag for worhp xml creation
        xmlCreateFlag
        % Matlab preference for license file
        LicenseFilePreferenceID
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
        % optimal langrange multipliers
        lambdaOpt
        % falcon.solver.worhp/muOpt is a property.
        muOpt
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
        function setFlagXML(obj, Flag)
        % Defines whether or not a *.xml is created from the parameter
        % struct.
        %  
        % <Syntax>
        % obj.setFlagXML(Flag)
        %  
        % <Description>
        % Set a flag to specify whether the parameter struct should be
        % used to create the worhp.xml or not. If no *.xml should be
        % created (Flag=false), the user must provide the *.xml
        % him-/herself and put it in the current folder. This file must
        % be named "worhp.xml". The user also has the possibility to
        % set appropriate environment variables as specified in the
        % WORHP User Guide.
        %  
        % <NameValue>
        % > Flag: Logic value (default: true, i.e., creation of xml)
        %  
        % <Keywords>
        % Worhp!Settings!XML
        end

        function setLicPathName(obj, varargin)
        % Sets the license path and name for the worhp-license file
        %  
        % <Syntax>
        % obj.setLicPathName(.., 'Name',Value)
        %  
        % <Description>
        % Sets the license path as well as license name (including file
        % extension) of the user's worhp license file. By default it is
        % assumed that the license is located in the worhp mex-file and
        % the license is named worhp.lic
        %  
        % <NameValue>
        % > licPath: Full path to folder where the worhp license file
        % is located (default: worhp mex-file folder)
        % > licName: Name of worhp license file including file
        % extension (default: 'worhp.lic')
        %  
        % <Keywords>
        % Worhp!Settings!License
        end

        function setMaximumCPUTime(obj, Seconds)
        % Sets the maximum cpu time (seconds) for worhp.
        %  
        % <Syntax>
        % obj.setMaximumCPUTime(Seconds)
        %  
        % <Description>
        % Sets the maximum cpu time in the worhp instance used here.
        %  
        % <Inputs>
        % > Seconds: The maximum cpu time ipopt is allowed to use to
        % solve the problem. Limit is checked during conversion check.
        %  
        % <Keywords>
        % Worhp!Settings!CPU Time
        end

        function [z_opt, F_opt, status, lambda, mu] = WarmStart(obj, varargin)
        % Reuse previously calculated solutions to perform a warmstart of the solver.
        %  
        % <Syntax>
        % [z_opt, F_opt, status, lambda, mu] = obj.WarmStart('Name',Value)
        %  
        % <Description>
        % Solve the given optimal control problem numerically using the numerical
        % solver worhp and applying initial guesses for the Lagrange
        % multipliers.
        %  
        % <NameValue>
        % > zInitial: The initial parameter vector to start the
        % solution (default: previous optimal solution)
        % > mu: Lagrange multipliers for the optimization
        % parameters (default: previous optimal solution)
        % > lambda: Lagrange multipliers for the residuals
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
        % Worhp!Warm Start
        end

        function [z_opt, F_opt, status, lambda, mu] = Solve(obj, varargin)
        % Solve the given optimal control problem using WORHP
        %  
        % <Syntax>
        % [z_opt, F_opt, status, lambda, mu] = obj.Solve()
        % [z_opt, F_opt, status, lambda, mu] = obj.Solve(zInitial)
        % [z_opt, F_opt, status, lambda, mu] = obj.Solve(zInitial,xmul,Fmul)
        %  
        % <Description>
        % Solve the given optimal control problem numerically using the numerical
        % solver ipopt.
        %  
        % <NameValue>
        % > zInitial: The initial parameter vector to start the solution.
        % > mu: Lagrange multipliers for the optimization parameters.
        % > lambda: Lagrange multipliers for the residuals.
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
        % Worhp!Solve
        end

        function status = setParamsWORHP(obj, type, name, value)
        % Allows to set and change worhp parameters.
        %  
        % <Syntax>
        % status = setParamsWORHP(type,name,value)
        %  
        % <Description>
        % This function allows to reset default parameters of WORPH
        % that were set by the paramsWORHP function. Note that solver
        % settings such as tolerances, maximum number of iteration, and
        % timeout are set automatically when calling obj.Solve. For
        % these the values from the options-struct or the object are
        % used and can be set by applying the appropriate methods. Note
        % that no specific sanity check is taken and thus, it is your
        % responsiblity to provide meaningful values.
        %  
        % <Inputs>
        % > type: The type of the parameter (i.e., "BOOL", "INT",
        % or "DOUBLE").
        % > name: The of the parameter as specified in the WORHP manual
        % and used in the worhp.xml
        % > value: The value used for the parameter.
        %  
        % <Keywords>
        % Worph!Set Parameters
        end

        function obj = worhp(varargin)
        % Constructs a falcon.solver.worhp object.
        %  
        % <Syntax>
        % obj = worhp()
        % obj = worhp(Problem)
        %  
        % <Description>
        % Creates a new worhp interface object used to numerically solve an
        % optimal control problem. The problem can either directly be set, or can
        % later be added using the method setProblem.
        %  
        % <Inputs>
        % > Problem: The problem to be solved using this numerical solver.
        %  
        % <Keywords>
        % Constructor!Worhp
        end

        function file = getLicenseFilePreference()
        % falcon.solver.worhp.getLicenseFilePreference is a function.
        %   [file] = falcon.solver.worhp.getLicenseFilePreference
        end

        function setLicenseFilePreference(file)
        % falcon.solver.worhp.setLicenseFilePreference is a function.
        %   falcon.solver.worhp.setLicenseFilePreference(file)
        end

        function file = selectLicenseFile()
        % falcon.solver.worhp.selectLicenseFile is a function.
        %   [file] = falcon.solver.worhp.selectLicenseFile
        end

        function data = ParseConsoleOutput(str)
        % falcon.solver.worhp.ParseConsoleOutput is a function.
        %   data = falcon.solver.worhp.ParseConsoleOutput(str)
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