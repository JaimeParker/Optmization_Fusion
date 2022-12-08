classdef Remove < falcon.gui.plot.config.cmd.Command
    % Removes a value from a cell array.
    %  
    % <Syntax>
    % removeCommand.apply()
    % removeCommand.revert()

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
        % Reinserts the value into the array.
        end

        function apply(self)
        % Removes the value from the cell array.
        end

        function self = Remove(object, property, index)
        % Removes a value from a cell array.
        %  
        % <Syntax>
        % removeCommand.apply()
        % removeCommand.revert()
        end

    end

end