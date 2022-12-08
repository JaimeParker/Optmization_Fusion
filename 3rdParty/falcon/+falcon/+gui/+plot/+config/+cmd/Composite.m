classdef Composite < falcon.gui.plot.config.cmd.Command
    % Wraps multiple commands, executes them atomically.

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
        % falcon.gui.plot.config.cmd.Composite/revert is a function.
        %   revert(self)
        end

        function apply(self)
        % falcon.gui.plot.config.cmd.Composite/apply is a function.
        %   apply(self)
        end

        function self = Composite(object, commands)
        % Wraps multiple commands, executes them atomically.
        end

    end

end