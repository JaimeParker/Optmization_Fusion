classdef (Abstract) PhaseExtension < falcon.core.Handle & falcon.core.HasProblem & matlab.mixin.Heterogeneous
    % PHASEEXT Summary of this class goes here
    %   Detailed explanation goes here

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
        % falcon.ext.PhaseExtension/Phase is a property.
        Phase
    end

    methods
        function setPhase(Obj, phase)
        % falcon.ext.PhaseExtension/setPhase is a function.
        %   setPhase(Obj, phase)
        end

        function Obj = PhaseExtension()
        % PHASEEXT Summary of this class goes here
        %   Detailed explanation goes here
        end

        function OnPreCheckConsistency(Obj)
        % falcon.ext.PhaseExtension/OnPreCheckConsistency is a function.
        %   obj = falcon.ext.PhaseExtension
        end

    end

end