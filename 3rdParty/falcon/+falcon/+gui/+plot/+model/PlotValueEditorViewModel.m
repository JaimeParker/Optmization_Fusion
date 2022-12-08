classdef PlotValueEditorViewModel < falcon.core.Handle
    % Toolbox for non-UI related tasks for the plot value editor view.

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
        % 1x1 falcon.gui.plot.config.Plot
        PlotConfig
    end

    methods
        function self = PlotValueEditorViewModel(problemAdapter, rootConfig, commandHistory, lineConfigProvider, gridTypes)
        % Toolbox for non-UI related tasks for the plot value editor view.
        end

        function updateConfigWithKeyIdentifier(self, identifier)
        % Updates the plotConfig.KeyIdentifier.
        end

        function updateConfigWithValues(self, singleSelectedPhases)
        % Updates the plotConfig.Lines, modifies existing line handles.
        end

        function areSelected = selectedValues(self)
        % Determines checked nodes in the value tree.
        %  
        % the order of the nodes in the tree is as follows:
        % id 1 phase 1     (index 1)
        % ...
        % id 1 phase k_m_1 (index k_m_1)
        % ...
        % id n phase k_1_n (index sum(all before) + k_1_n)
        % ...
        % id n phase k_m_n (index sum(all before) + k_m_n)
        %  
        % this order is stored in:
        % allPhases = {1:k_m_1, ... k_0_n:k_m_n} (some can be missing)
        % allCounts = [    m_1, ...         m_n] (for every group)
        % allStarts = [      1, ... cumsum(...)] (sums all before)
        %  
        % they are looked up as:
        % identifier     -> where in allIdentifiers
        % selected phase -> where in allPhases? (simple indexing is not
        %                   possible, phases might be missing)
        % start + where  -> node position, set true
        end

        function identifiers = keyIdentifiers(self)
        % Formats the identifiers that can be selected as x axis key.
        end

        function identifier = selectedKeyIdentifier(self)
        % Returns the currently active KeyIdentifier.
        end

    end

end