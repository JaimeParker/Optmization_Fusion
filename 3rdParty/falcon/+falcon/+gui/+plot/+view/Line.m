classdef Line < falcon.core.Handle & SimpleListener
    % Draws a line in a falcon.gui.plot.view.Plot.

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
        % 1x1 function_handle - invoked on mouse clicks
        OnLineClickFcn
        % 1x1 matlab.graphics.line
        LineHandle
        % 1x1 logical - true if this line is marked as selected
        IsSelected
    end

    methods
        function delete(self)
        % DELETE   Delete a handle object.
        %   DELETE(H) deletes all handle objects in array H. After the delete 
        %   function call, H is an array of invalid objects.
        end

        function self = Line(problemAdapter, lineHandle)
        % Draws a line in a falcon.gui.plot.view.Plot.
        end

        function bindTo(self, plotConfig, index)
        % Plots the specified line and tracks changes to its config.
        %  
        % <Inputs>
        % > plotConfig: falcon.gui.plot.config.Plot parent of the line
        % > index: selects the line at plotConfig.Lines{index}
        end

        function onFormatChange(self, ~, ~)
        % Called when the line format changes - update properties.
        end

        function onDataChange(self, ~, ~)
        % Called when line or plot identifier / phases change - redraw.
        end

    end

end