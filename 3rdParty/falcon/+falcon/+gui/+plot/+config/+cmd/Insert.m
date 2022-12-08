classdef Insert < falcon.gui.plot.config.cmd.Command
    % Inserts a value into a cell array.
    %  
    % <Syntax>
    % insertCommand.apply()
    % insertCommand.revert()

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
        function revert(self)
        % Removes the inserted value.
        end

        function apply(self)
        % Applies the insertion.
        end

        function self = Insert(object, property, value, index)
        % Inserts a value into a cell array.
        %  
        % <Syntax>
        % insertCommand.apply()
        % insertCommand.revert()
        end

    end

end