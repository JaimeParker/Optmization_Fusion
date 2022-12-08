classdef LayoutInflater < falcon.core.Handle
    % Inflates layout XML files - example is given below.
    %  
    % <Description>
    % Note: the implementation for this class must remain stateless as the
    % same instance is invoked recursively to reduce memory allocation.
    %  
    % An example is given below. The tag names are the class names to be
    % instantiated. If there is no such class name (see line 6), the
    % inflater tries to invoke it as a function. One constructor dependency
    % always provided is varargin = {'Parent', parentView}. Further
    % dependencies are automatically resolved with the Injector.
    %  
    %  1 <?xml version="1.0" encoding="UTF-8" standalone="no" ?>
    %  2 <uiextras.HBox Spacing="4"
    %  3                Widths="50,-2,-1">
    %  4     <include Layout="Label" Title="{Title}" />
    %  5
    %  6     <uicontrol Style="edit"
    %  7                HorizontalAlignment="left"
    %  8                InjectAs="{Property}" />
    %  9
    % 10     <uicontrol Style="popupmenu"
    % 11                InjectAs="{Property}Interpreter"
    % 12                String:cell="none,tex,latex" />
    % 13  </uiextras.HBox>
    %  
    % After instantiation, all given attributes are assigned as properties.
    % The inflater tries to infer the property class and cast the value
    % automatically. In ambiguous cases, you can override the type with the
    % colon operator (see line 12).
    %  
    % You can even include layouts with the <include> tag (see line 4).
    % The arguments given here can be injected via the {Argument} notation
    % in the sublayout xml file. That way parametric layouts can be reused.
    %  
    % The "InjectAs" property (line 8) is interpreted differently, it tries
    % to assign the view to the named property on the controller instance.
    % The controller instance is the object passed via
    % inflater.inflate(..., controller).
    %  
    % <Syntax>
    % inflater = Injector().get(?falcon.gui.LayoutInflater)
    % view = inflater.inflate(fileName, viewParent, controller)

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
        function view = inflate(self, fileName, viewParent, controller)
        % Inflate the given XML file into the given parent.
        %  
        % <Syntax>
        % view = inflater.inflate(fileName, viewParent, controller)
        %  
        % <Inputs>
        % > fileName  : Path to XML file, has to be absolute or on
        %               Matlab path.
        % > viewParent: Parent view container.
        % > controller: "InjectAs" will inject views as properties into
        %               this handle.
        %  
        % <Outputs>
        % > view: View instance corresponding with the root node of the
        %         XML declaration.
        end

        function self = LayoutInflater(viewProvider, stringUtil)
        % Inflates layout XML files - example is given below.
        %  
        % <Description>
        % Note: the implementation for this class must remain stateless as the
        % same instance is invoked recursively to reduce memory allocation.
        %  
        % An example is given below. The tag names are the class names to be
        % instantiated. If there is no such class name (see line 6), the
        % inflater tries to invoke it as a function. One constructor dependency
        % always provided is varargin = {'Parent', parentView}. Further
        % dependencies are automatically resolved with the Injector.
        %  
        %  1 <?xml version="1.0" encoding="UTF-8" standalone="no" ?>
        %  2 <uiextras.HBox Spacing="4"
        %  3                Widths="50,-2,-1">
        %  4     <include Layout="Label" Title="{Title}" />
        %  5
        %  6     <uicontrol Style="edit"
        %  7                HorizontalAlignment="left"
        %  8                InjectAs="{Property}" />
        %  9
        % 10     <uicontrol Style="popupmenu"
        % 11                InjectAs="{Property}Interpreter"
        % 12                String:cell="none,tex,latex" />
        % 13  </uiextras.HBox>
        %  
        % After instantiation, all given attributes are assigned as properties.
        % The inflater tries to infer the property class and cast the value
        % automatically. In ambiguous cases, you can override the type with the
        % colon operator (see line 12).
        %  
        % You can even include layouts with the <include> tag (see line 4).
        % The arguments given here can be injected via the {Argument} notation
        % in the sublayout xml file. That way parametric layouts can be reused.
        %  
        % The "InjectAs" property (line 8) is interpreted differently, it tries
        % to assign the view to the named property on the controller instance.
        % The controller instance is the object passed via
        % inflater.inflate(..., controller).
        %  
        % <Syntax>
        % inflater = Injector().get(?falcon.gui.LayoutInflater)
        % view = inflater.inflate(fileName, viewParent, controller)
        end

    end

end