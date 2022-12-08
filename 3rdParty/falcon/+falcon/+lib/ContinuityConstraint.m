classdef ContinuityConstraint < falcon.core.Handle
    % -------------------------------------------------------------------------
    %                                FALCON.m
    % Copyright (c) 2014-2019 Institute of Flight System Dynamics, TUM, Munich
    % Matthias Bittner, Matthias Rieck, Maximilian Richter,
    % Benedikt Grueter, Johannes Diepolder, Florian Schwaiger,
    % Patrick Piprek, and Florian Holzapfel
    % Downloading, using, copying, or modifying FALCON.m code constitutes an
    % agreement to ALL of the terms of the FALCON.m EULA.
    % -------------------------------------------------------------------------

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
        % falcon.lib.ContinuityConstraint/Signals is a property.
        Signals
        % falcon.lib.ContinuityConstraint/Phases is a property.
        Phases
        % falcon.lib.ContinuityConstraint/Constraints is a property.
        Constraints
        % falcon.lib.ContinuityConstraint/NumSignals is a property.
        NumSignals
        % falcon.lib.ContinuityConstraint/NumPhases is a property.
        NumPhases
        % falcon.lib.ContinuityConstraint/NumConstraints is a property.
        NumConstraints
        % falcon.lib.ContinuityConstraint/Jacobian is a property.
        Jacobian
        % falcon.lib.ContinuityConstraint/Hessian is a property.
        Hessian
    end

    methods
        function info = describe(self)
        % FALCON.m model info.
        end

        function [val, jac, hess] = evaluate(self, varargin)
        % falcon.lib.ContinuityConstraint/evaluate is a function.
        %   [val, jac, hess] = evaluate(self, varargin)
        end

        function self = ContinuityConstraint(signals, phases)
        % Enforce signal continuity at given phase boundaries.
        %  
        % <Syntax>
        % [ c ] = falcon.lib.ContinuityConstraint(signals, phases)
        %  
        % <Description>
        % Create a point constraint that enforces continuity of the given
        % signals at the boundaries between the given phases.  It is
        % assumed that the phases are connected in the given order, but
        % this is neither checked nor required.  To ensure continuity
        % across a periodic boundary, pass the same phase twice.
        %  
        % The generated object is automatically added as a point
        % constraint upon construction.
        %  
        % This constraint is particularly useful to guarantee the
        % continuity of controls across phase boundaries.  For state
        % continuity, usually falcon.Problem.ConnectPhases() and
        % falcon.Problem.ConnectAllPhases() are used.
        %  
        % <Inputs>
        % > signals: The relevant signals.  All of these must have the same
        %   type (State/Control/Parameter).
        % > phases: The relevant phases.  At least two phases are required;
        %   phases need not be unique, though they should be in most cases.
        end

    end

end