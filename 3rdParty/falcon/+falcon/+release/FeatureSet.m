classdef FeatureSet
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
        % falcon.release.FeatureSet/Features is a property.
        Features
    end

    methods
        function flags = has(self, names)
        % falcon.release.FeatureSet/has is a function.
        %   [flags] = has(self, names)
        end

        function features = getFeatures(self, names)
        % falcon.release.FeatureSet/getFeatures is a function.
        %   [features] = getFeatures(self, names)
        end

        function [featureSet, g] = resolveDependencies(self, requiredFeatureNames)
        % [ featureSet, g ] = FeatureSet.resolveDependencies(requiredFeatureNames)
        %  
        % Returns a new FeatureSet with all features required to satisfy
        % the dependencies of requiredFeatureNames.  The features are given
        % in reverse topological order, i.e., dependencies first.
        % Additionally, the reduced dependency graph is returned.
        end

        function g = getDependencyGraph(self)
        % [ g ] = FeatureSet.getDependencyGraph()
        %  
        % Returns a digraph of features, where each feature points to its
        % dependencies.
        end

        function self = FeatureSet(features)
        % -------------------------------------------------------------------------
        %                                FALCON.m
        % Copyright (c) 2014-2019 Institute of Flight System Dynamics, TUM, Munich
        % Matthias Bittner, Matthias Rieck, Maximilian Richter,
        % Benedikt Grueter, Johannes Diepolder, Florian Schwaiger,
        % Patrick Piprek, and Florian Holzapfel
        % Downloading, using, copying, or modifying FALCON.m code constitutes an
        % agreement to ALL of the terms of the FALCON.m EULA.
        % -------------------------------------------------------------------------
        end

    end

end