classdef (Abstract) HasName < falcon.core.Handle & falcon.core.HasProblem
    % HASNAME Summary of this class goes here
    %   Detailed explanation goes here

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
        % Name of object.
        Name
    end

    methods
        function map = byNameUnique(self)
        % Get a struct for name based access to the object array, allowing
        % only unique names.
        %  
        % <Syntax>
        % [ map ] = obj.byNameUnique()
        %  
        % <Description>
        % The method returns all entries from the object array 'obj' as
        % fields of a struct, with the object Name as field name.  Throws
        % an error in case there are any duplicate names.
        %  
        % <Keywords>
        % OVC!byName!Unique
        end

        function map = byName(self)
        % Get a struct for name based access to the object array.
        %  
        % <Syntax>
        % [ map ] = obj.byName()
        %  
        % <Description>
        % The method returns all entries from the object array 'obj' as
        % fields of a struct, with the object Name as field name.  In case
        % there are duplicate names, the output struct contains object
        % arrays.
        %  
        % <Keywords>
        % OVC!byName
        end

        function obj = HasName()
        % HASNAME Summary of this class goes here
        %   Detailed explanation goes here
        end

    end

end