classdef (Abstract) DiscretizationMethod < falcon.core.Handle & falcon.core.HasProblem
    % The falcon.discretization.DiscretizationMethod class is the abstract class representing a
    % general discretization method. It has to be derived to form a numeric
    % discretization method for an optimal control problem.

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
    end

    methods
        function [F, G] = evaluateFandG(obj, z)
        % Evaluate the residual vector and gradient of the problem for testing purposes.
        %  
        % <Syntax>
        % [F,G] = obj.evaluateF(z)
        %  
        % <Description>
        % Uses the given parameter vector z to evaluate the residual
        % vector and gradient of the discretized problem.
        %  
        % <Inputs>
        % >z: A parameter vector for the discretized problem (use e.g.
        % problem.zInitial).
        %  
        % <Keywords>
        % Discretization!Evaluate!Residual; Discretization!Evaluate!Gradient
        end

        function C = evaluateC(obj, z)
        % Evaluate the constraints of the optimal control problem
        %  
        % <Syntax>
        % C = obj.evaluateC(z)
        %  
        % <Description>
        % Uses the parameter vector z to return the current constraints
        % of the optimal control problem.
        %  
        % <Inputs>
        % >z: A parameter vector for the discretized problem (use e.g.
        % problem.zInitial).
        %  
        % <Keywords>
        % Discretization!Evaluate!Constraint
        end

        function J = evaluateJ(obj, z)
        % Evaluate the cost function for the differential evolution.
        %  
        % <Syntax>
        % J = obj.evaluateJ(z)
        %  
        % <Description>
        % Uses the parameter vector z to return the current cost
        % functional.
        %  
        % <Inputs>
        % >z: A parameter vector for the discretized problem (use e.g.
        % problem.zInitial).
        %  
        % <Keywords>
        % Discretization!Evaluate!Cost
        end

        function ret = evaluateF(obj, z)
        % Evaluate the residual vector of the problem for testing purposes.
        %  
        % <Syntax>
        % f = obj.evaluateF(z)
        %  
        % <Description>
        % Uses the given parameter vector z to evaluate the residual
        % vector of the discretized problem.
        %  
        % <Inputs>
        % >z: A parameter vector for the discretized problem (use e.g.
        % problem.zInitial).
        %  
        % <Keywords>
        % Discretization!Evaluate!Residual
        end

        function ret = evaluateG(obj, z)
        % Evaluate the gradient matrix of the problem for testing purposes.
        %  
        % <Syntax>
        % grad = obj.evaluateG(z)
        %  
        % <Description>
        % Uses the given parameter vector z to evaluate the sparse gradient matrix
        % of the discretized problem.
        %  
        % <Inputs>
        % >z: A parameter vector for the discretized problem (use e.g.
        % problem.zInitial).
        %  
        % <Keywords>
        % Discretization!Evaluate!Gradient
        end

        function obj = DiscretizationMethod()
        % The falcon.discretization.DiscretizationMethod class is the abstract class representing a
        % general discretization method. It has to be derived to form a numeric
        % discretization method for an optimal control problem.
        end

    end

end