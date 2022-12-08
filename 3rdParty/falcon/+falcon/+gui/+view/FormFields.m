classdef (Abstract) FormFields < dynamicprops
    % Controller that has fields mapping directly to properties.
    %  
    % <Description>
    % This class inherits from dynamicprops, which allows to configure
    % a variable number of form fields accessible as properties on this
    % class. The name of the form fields must match the name of the
    % settable property fields exactly, i.e. a 'Title' form field sets the
    % value for the 'Title' config field.
    %  
    % Abstract properties are:
    % > FORM_FIELDS: protected constant cell array of property names
    % > field(name): protected method which provides the field value
    % > setField(name, value): protected method updating the value

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
        function self = FormFields()
        % Controller that has fields mapping directly to properties.
        %  
        % <Description>
        % This class inherits from dynamicprops, which allows to configure
        % a variable number of form fields accessible as properties on this
        % class. The name of the form fields must match the name of the
        % settable property fields exactly, i.e. a 'Title' form field sets the
        % value for the 'Title' config field.
        %  
        % Abstract properties are:
        % > FORM_FIELDS: protected constant cell array of property names
        % > field(name): protected method which provides the field value
        % > setField(name, value): protected method updating the value
        end

    end

end