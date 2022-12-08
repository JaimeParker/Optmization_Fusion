classdef MainWindow < falcon.gui.Window
    % Root class for the plot post processor UI window.
    %  
    % <Syntax>
    % window = falcon.gui.plot.show(problem)
    % window = falcon.gui.plot.show(problem, 'File', configFilePath)
    % window = falcon.gui.plot.show(problem, 'Config', configRootHandle)

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
        % 1x1 logical
        AskSaveOnClose
        % Context -  1x1 converter.gui.Context
        Context
        % Intent -  1x1 converter.gui.Intent
        Intent
        % Figure -  1x1 figure handle
        Figure
    end

    methods
        function self = MainWindow(windowArgs, mainViewModel, menuBuilder, uiTools)
        % Root class for the plot post processor UI window.
        %  
        % <Syntax>
        % window = falcon.gui.plot.show(problem)
        % window = falcon.gui.plot.show(problem, 'File', configFilePath)
        % window = falcon.gui.plot.show(problem, 'Config', configRootHandle)
        end

        function onLineSelected(self, plotGrid, ~)
        % Called when a line is selected with the mouse. Updates the
        % line editor to match the current selection.
        end

        function onPlotSelected(self, plotGrid, ~)
        % Called when a plot is selected with the mouse. Updates the
        % editors and main menu items to match the current selection.
        end

        function onMenuClickExportSelected(self, ~, ~)
        % Called when the menu item "Plot > Export Selected" is clicked.
        end

        function onMenuClickResetLayout(self, rows, columns)
        % Called when the menu item "Plot > m x n Plots" is clicked.
        end

        function onMenuClickClearAll(self, ~, ~)
        % Called when the menu item "Plot > Clear All" is clicked.
        end

        function onMenuClickClearSelected(self, ~, ~)
        % Called when the menu item "Plot > Clear Selected" is clicked.
        end

        function onMenuClickMergeSelected(self, ~, ~)
        % Called when the menu item "Plot > Merge Selected" is clicked.
        end

        function onMenuClickSwapSelected(self, ~, ~)
        % Called when the menu item "Plot > Swap Selected" is clicked.
        end

        function onMenuClickRedo(self, ~, ~)
        % Called when the menu item "Edit > Redo" is clicked.
        end

        function onMenuClickUndo(self, ~, ~)
        % Called when the menu item "Edit > Undo" is clicked.
        end

        function onMenuClickExit(self, ~, ~)
        % Called when the menu item "File > Exit" is clicked.
        end

        function onMenuClickSave(self, ~, ~)
        % Called when the menu item "File > Save" is clicked.
        end

        function onMenuClickOpen(self, ~, ~)
        % Called when the menu item "File > Open" is clicked.
        end

        function onHistoryChange(self, ~, ~)
        % Called when a new undo / redo operation is available.
        end

        function delete(self)
        % DELETE - Deletes this window, closing the figure.
        end

        function close(self)
        % CLOSE - Closes the figure and deleted this window.
        end

        function waitUntilClosed(self)
        % WAITUNTILCLOSED - Blocks until the window is closed.
        end

        function undock(self)
        % UNDOCK - Undocks the figure from the MATLAB UI.
        end

        function dock(self)
        % DOCK - Docks the figure into the MATLAB UI.
        end

        function hide(self)
        % HIDE - Hides the figure from screen
        end

        function show(self)
        % SHOW - Displays the figure on screen.
        end

    end

end