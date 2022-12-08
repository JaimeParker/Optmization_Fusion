classdef TagIntent < converter.gui.Intent
    % Marks the user's intention to open a window.
    % The user indicates his intention by giving it a unique string tag.
    %  
    % <Syntax>
    % tag = 'my_custom_gui_identifier'
    % intent = Injector(tag).get(?falcon.gui.TagIntent)
    %  
    % <Dependencies>
    % > tag: A simple string identifier used to differentiate different
    %        intentions. Should be unique for your purpose.

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
        % WindowType -  1xn char
        WindowType
        % Arguments -  1x1 struct
        Arguments
        % Data -  1x1 converter.model.data.Data
        Data
        % ResultCallback -  1x1 function_handle
        ResultCallback
    end

    methods
        function self = TagIntent(tag)
        % Marks the user's intention to open a window.
        % The user indicates his intention by giving it a unique string tag.
        %  
        % <Syntax>
        % tag = 'my_custom_gui_identifier'
        % intent = Injector(tag).get(?falcon.gui.TagIntent)
        %  
        % <Dependencies>
        % > tag: A simple string identifier used to differentiate different
        %        intentions. Should be unique for your purpose.
        end

    end

end