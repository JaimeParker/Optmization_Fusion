classdef History < falcon.core.Handle
    % Records commands and provides undo() and redo() functionality.
    %  
    % <Syntax>
    % history = Injector().get(?falcon.gui.plot.config.cmd.History)
    % history.do().update(...).with(...).andApply()

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
        function clear(self)
        % Clears the history, no more undo() or redo() possible.
        end

        function canRedo = canRedo(self, varargin)
        % True, if there are enough commands to be redone.
        %  
        % <Syntax>
        % canRedo = history.canRedo()
        % canRedo = history.canRedo(amount)
        end

        function canUndo = canUndo(self, varargin)
        % True, if there are enough commands to be undone.
        %  
        % <Syntax>
        % canUndo = history.canUndo()
        % canUndo = history.canUndo(amount)
        end

        function redo(self, varargin)
        % Reapplies the latest command. This operation can be reverted by
        % calling undo().
        %  
        % <Syntax>
        % history.redo()
        % history.redo(10)
        end

        function undo(self, varargin)
        % Reverts the latest command. This operation can be reverted by
        % calling redo().
        %  
        % <Syntax>
        % history.undo()
        % history.undo(10)
        end

        function apply(self, command)
        % Executes the given command and records it. This clears all
        % reverted commands, no redo() is possible now.
        %  
        % <Syntax>
        % history.apply(command)
        %  
        % <Inputs>
        % > command: falcon.gui.plot.config.cmd.Command to execute
        end

        function builder = do(self)
        % Start building a new command.
        %  
        % <Syntax>
        % history.do().update(...).with(...).andApply()
        %  
        % <Outputs>
        % > builder: falcon.gui.plot.config.cmd.Builder instance
        end

        function self = History(builder)
        % Records commands and provides undo() and redo() functionality.
        %  
        % <Syntax>
        % history = Injector().get(?falcon.gui.plot.config.cmd.History)
        % history.do().update(...).with(...).andApply()
        end

    end

end