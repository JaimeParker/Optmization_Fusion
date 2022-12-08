classdef PlotViewModel < falcon.core.Handle
    % Toolbox for non-UI related tasks for the plot view.

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
        % 1x1 double - relative plot axes margin
        BASE_MARGIN
        % 1x1 falcon.gui.plot.config.Plot
        PlotConfig
    end

    methods
        function self = PlotViewModel(problemAdapter, plotConfig)
        % Toolbox for non-UI related tasks for the plot view.
        end

        function lineConfig = lineConfig(self, index)
        % Returns the line config at the given index.
        end

        function xRange = xRange(self)
        % falcon.gui.plot.model.PlotViewModel/xRange is a function.
        %   xRange = xRange(self)
        end

        function margin = margin(self)
        % Determines the horizontal and vertical margins of the axes.
        end

        function outerPosition = outerPosition(self)
        % Determines the outer position (including space for axes tags
        % and labels) of the plot in the layout grid.
        end

        function shown = shownLines(self)
        % Determines which lines are to be shown in the legend box.
        end

        function titles = legendTitles(self)
        % Formats the non-empty line titles for the legend box.
        end

        function value = format(self, field)
        % Retrieves a named plotConfig.Format field.
        end

        function title = title(self)
        % Formats the title of the plot.
        end

    end

end