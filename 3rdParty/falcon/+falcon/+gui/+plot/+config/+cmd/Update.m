classdef Update < falcon.gui.plot.config.cmd.Command
    % Updates a property value.
    %  
    % <Syntax>
    % updateCommand.apply()
    % updateCommand.revert()

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
        % Reverts the property to its previous value.
        end

        function apply(self)
        % Updates the property value.
        end

        function self = Update(object, property, value)
        % Updates a property value.
        %  
        % <Syntax>
        % updateCommand.apply()
        % updateCommand.revert()
        end

    end

end