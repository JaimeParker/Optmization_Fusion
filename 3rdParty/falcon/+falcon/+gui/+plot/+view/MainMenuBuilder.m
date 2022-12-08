classdef MainMenuBuilder < falcon.core.Handle
    % Builds the menu for the main plot window.

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
        function menuItems = buildForWindow(self, window)
        % Creates the main menu for the given falcon.gui.Window.
        %  
        % <Inputs>
        % > window: falcon.gui.Window for the main menu
        %  
        % <Outputs>
        % > menuItems: struct with all menu items by tag
        end

        function self = MainMenuBuilder(uiTools)
        % Builds the menu for the main plot window.
        end

    end

end