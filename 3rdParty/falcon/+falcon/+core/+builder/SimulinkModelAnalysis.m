classdef SimulinkModelAnalysis < handle
    % Extract relevant interface and compatibility information from a given
    % Simulink Model.

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
        % falcon.core.builder.SimulinkModelAnalysis/ModelName is a property.
        ModelName
        % falcon.core.builder.SimulinkModelAnalysis/ModelHandle is a property.
        ModelHandle
        % falcon.core.builder.SimulinkModelAnalysis/ModelFunction is a property.
        ModelFunction
        % falcon.core.builder.SimulinkModelAnalysis/RootInports is a property.
        RootInports
        % falcon.core.builder.SimulinkModelAnalysis/RootOutports is a property.
        RootOutports
        % falcon.core.builder.SimulinkModelAnalysis/Integrators is a property.
        Integrators
        % falcon.core.builder.SimulinkModelAnalysis/UnsupportedBlocks is a property.
        UnsupportedBlocks
        % falcon.core.builder.SimulinkModelAnalysis/ModelReferences is a property.
        ModelReferences
        % falcon.core.builder.SimulinkModelAnalysis/UsedBlockTypes is a property.
        UsedBlockTypes
        % falcon.core.builder.SimulinkModelAnalysis/KnownGoodBlocks is a property.
        KnownGoodBlocks
    end

    methods
        function self = SimulinkModelAnalysis(modelName, varargin)
        % Extract relevant interface and compatibility information from a given
        % Simulink Model.
        end

    end

end