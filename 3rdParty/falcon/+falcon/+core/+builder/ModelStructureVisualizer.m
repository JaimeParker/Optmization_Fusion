classdef ModelStructureVisualizer
    % Visualize the dependency structure of a FALCON.m model.

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
        % falcon.core.builder.ModelStructureVisualizer/InputNodeColor is a property.
        InputNodeColor
        % falcon.core.builder.ModelStructureVisualizer/OutputNodeColor is a property.
        OutputNodeColor
        % falcon.core.builder.ModelStructureVisualizer/ConstantNodeColor is a property.
        ConstantNodeColor
        % falcon.core.builder.ModelStructureVisualizer/SystemNodeColor is a property.
        SystemNodeColor
        % falcon.core.builder.ModelStructureVisualizer/VariableNodeColor is a property.
        VariableNodeColor
        % falcon.core.builder.ModelStructureVisualizer/InputNodeMarker is a property.
        InputNodeMarker
        % falcon.core.builder.ModelStructureVisualizer/OutputNodeMarker is a property.
        OutputNodeMarker
        % falcon.core.builder.ModelStructureVisualizer/ConstantNodeMarker is a property.
        ConstantNodeMarker
        % falcon.core.builder.ModelStructureVisualizer/SystemNodeMarker is a property.
        SystemNodeMarker
        % falcon.core.builder.ModelStructureVisualizer/VariableNodeMarker is a property.
        VariableNodeMarker
        % falcon.core.builder.ModelStructureVisualizer/DependencyCycleMarkerSize is a property.
        DependencyCycleMarkerSize
        % falcon.core.builder.ModelStructureVisualizer/DependencyCycleEdgeColor is a property.
        DependencyCycleEdgeColor
        % falcon.core.builder.ModelStructureVisualizer/DependencyCycleEdgeWidth is a property.
        DependencyCycleEdgeWidth
    end

    methods
        function g = visualize(self, varargin)
        % Visualize the dependency structure of a FALCON.m model.
        %  
        % <Syntax>
        % [ g ] = visualizer.Visualize(model)
        %  
        % <Description>
        % The visualizer takes a model builder or a dependency structure
        % obtained from a model builder and visualizes the signal flow
        % graph.
        %  
        % <Inputs>
        % > model: a falcon.core.builder.BaseBuilder or
        %   falcon.core.builder.DerivativeBuilder instance (this includes
        %   falcon.SimulationModelBuilder, falcon.PointConstraintBuilder
        %   and falcon.PathConstraintBuilder).
        %  
        % <Outputs>
        % > g: handle to created graphics objects
        end

        function obj = ModelStructureVisualizer()
        % Visualize the dependency structure of a FALCON.m model.
        end

    end

end