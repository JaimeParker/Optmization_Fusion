classdef ScrollPanel < uiextras.HBox
    % Is a container that allows scrolling its contents.
    %  
    % <Syntax>
    % parent = figure()
    % scrollPanel = falcon.gui.view.ScrollPanel('Parent', parent)
    % scrollableChildPanel = uiextras.VBox('Parent', scrollPanel)
    %  
    % <Layout XML>
    % <falcon.gui.view.ScrollPanel ScrollbarWidth="8" ScrollPosition="0">
    %   <uiextras.VBox>
    %      <!-- ........ -->
    %   </uiextras.VBox>
    % </falcon.gui.view.ScrollPanel>

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
        % 1x1 double - width of the scrollbar in pixels
        ScrollbarWidth
        % 1x1 double - 0 to 1 fraction: 0 is top position, 1 is bottom
        ScrollPosition
        % 1x1 matlab.ui.container.internal.UIContainer
        Panel
        % 1x1 uicontrol - with style 'slider'
        Slider
    end

    methods
        function self = ScrollPanel(varargin)
        % Is a container that allows scrolling its contents.
        %  
        % <Syntax>
        % parent = figure()
        % scrollPanel = falcon.gui.view.ScrollPanel('Parent', parent)
        % scrollableChildPanel = uiextras.VBox('Parent', scrollPanel)
        %  
        % <Layout XML>
        % <falcon.gui.view.ScrollPanel ScrollbarWidth="8" ScrollPosition="0">
        %   <uiextras.VBox>
        %      <!-- ........ -->
        %   </uiextras.VBox>
        % </falcon.gui.view.ScrollPanel>
        end

        function lhs1 = loadobj(rhs1, rhs2)
        % CustomizedLoadObj
        end

    end

end