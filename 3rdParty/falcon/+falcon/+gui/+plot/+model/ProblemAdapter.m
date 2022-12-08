classdef ProblemAdapter < falcon.core.Handle
    % Adapter to the falcon.Problem, provides fast access to grid values.

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
        % 1x1 struct - identifier -> 1xn double mapping of available phases
        SortedPhaseIndices
        % {1xn char} - grid names found in the falcon.Problem
        GRID_TYPES
    end

    methods
        function self = ProblemAdapter(problem, stringUtil)
        % Adapter to the falcon.Problem, provides fast access to grid values.
        end

        function name = nameOfIdentifier(~, identifier)
        % Formats the name part of a 'type_name' identifier.
        end

        function range = rangeByIdentifier(self, identifier)
        % falcon.gui.plot.model.ProblemAdapter/rangeByIdentifier is a function.
        %   range = rangeByIdentifier(self, identifier)
        end

        function values = timeValuesByPhaseIndices(self, phaseIndices)
        % Computes the simulation time array for the given phases.
        %  
        % <Inputs>
        % > phaseIndices: phase indices for the simulation time
        %  
        % <Outputs>
        % > values: mx1 array of double values matching the real
        %           simulation time, spaced by 1 NaN between each phase
        end

        function values = valuesByIdentifierAndPhaseIndices(self, identifier, phaseIndices)
        % Computes the value array of the given identifier and phases.
        %  
        % <Inputs>
        % > identifier: grid type and value name combined as 'type_name'
        % > phaseIndices: phase indices for the given value
        %  
        % <Outputs>
        % > values: mx1 array of double values, spaced by one NaN
        %           between each phase
        end

        function phaseNumber = phaseNumberAt(self, index)
        % Returns the display number of the phase at given index.
        end

        function identifiers = identifiers(self)
        % Returns all available identifiers, for all grid types.
        end

        function identifiers = identifiersByType(self, type)
        % For the given grid type, returns all valid value identifiers.
        end

    end

end