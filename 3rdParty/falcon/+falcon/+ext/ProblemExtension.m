classdef (Abstract) ProblemExtension < falcon.core.Handle & falcon.core.HasProblem & matlab.mixin.Heterogeneous
    % PROBLEMEXTENSION Summary of this class goes here
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
    end

    methods
        function OnPostCheckConsistency(Obj)
        % falcon.ext.ProblemExtension/OnPostCheckConsistency is a function.
        %   obj = falcon.ext.ProblemExtension
        end

        function OnPreCheckConsistency(Obj)
        % falcon.ext.ProblemExtension/OnPreCheckConsistency is a function.
        %   obj = falcon.ext.ProblemExtension
        end

        function obj = ProblemExtension()
        % PROBLEMEXTENSION Summary of this class goes here
        %   Detailed explanation goes here
        end

    end

end