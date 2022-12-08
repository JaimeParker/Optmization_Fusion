classdef Window < converter.gui.Window
    % Base class for GUIs. It is given a layout xml file name that
    % is parsed using the falcon.gui.LayoutInflater tool.
    %  
    % <Syntax>
    % layoutFileName = 'path/to/layout/file.xml'
    % tag = 'my_unique_gui_identifier'
    % window = Injector(layoutFileName, tag).get(?falcon.gui.Window)
    %  
    % <Dependencies>
    % > layoutFileName: XML file that defines the layout elements
    % > tag: Should be unique for your purpose, window preferences such
    %       as previous monitor position will be saved with it.

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
        % Context -  1x1 converter.gui.Context
        Context
        % Intent -  1x1 converter.gui.Intent
        Intent
        % Figure -  1x1 figure handle
        Figure
    end

    methods
        function self = Window(context, intent, layoutInflater, layoutFileName)
        % Base class for GUIs. It is given a layout xml file name that
        % is parsed using the falcon.gui.LayoutInflater tool.
        %  
        % <Syntax>
        % layoutFileName = 'path/to/layout/file.xml'
        % tag = 'my_unique_gui_identifier'
        % window = Injector(layoutFileName, tag).get(?falcon.gui.Window)
        %  
        % <Dependencies>
        % > layoutFileName: XML file that defines the layout elements
        % > tag: Should be unique for your purpose, window preferences such
        %       as previous monitor position will be saved with it.
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