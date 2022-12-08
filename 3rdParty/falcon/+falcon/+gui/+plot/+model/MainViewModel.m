classdef MainViewModel < falcon.core.Handle
    % Toolbox for non-UI related tasks for the main window.

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
        % 1x1 function_handle - called when commands are executed
        OnHistoryChangeCallback
        % falcon.gui.plot.model.MainViewModel.ASK_CLOSE_QUESTION is a property.
        ASK_CLOSE_QUESTION
        % falcon.gui.plot.model.MainViewModel.ASK_CLOSE_TITLE is a property.
        ASK_CLOSE_TITLE
        % falcon.gui.plot.model.MainViewModel.ASK_CLOSE_CLOSE is a property.
        ASK_CLOSE_CLOSE
        % falcon.gui.plot.model.MainViewModel.ASK_CLOSE_CANCEL is a property.
        ASK_CLOSE_CANCEL
        % falcon.gui.plot.model.MainViewModel.ERROR_MSG_LOAD is a property.
        ERROR_MSG_LOAD
        % falcon.gui.plot.model.MainViewModel.ERROR_MSG_SAVE is a property.
        ERROR_MSG_SAVE
        % falcon.gui.plot.model.MainViewModel.DIALOG_OPEN_NOTICE is a property.
        DIALOG_OPEN_NOTICE
        % falcon.gui.plot.model.MainViewModel.FILE_EXT is a property.
        FILE_EXT
        % falcon.gui.plot.model.MainViewModel.HIDDEN_BUTTON_TAGS is a property.
        HIDDEN_BUTTON_TAGS
    end

    methods
        function self = MainViewModel(problem, rootConfig, commandHistory, fileReaderProvider, fileWriterProvider)
        % Toolbox for non-UI related tasks for the main window.
        end

        function enable = enableExport(self, indices)
        % Formats 'on', if any plot is selected, else 'off'.
        end

        function enable = enableClear(~, indices)
        % Formats 'on', if any plot is selected, else 'off'.
        end

        function enable = enableSwap(~, indices)
        % Formats 'on', if two plots are selected, else 'off'.
        end

        function enable = enableMerge(self, indices)
        % Formats 'on', if two adjacent plots are selected, else 'off'.
        end

        function enable = enableRedo(self)
        % Formats 'on', if redo is possible, else 'off'.
        end

        function enable = enableUndo(self)
        % Formats 'on', if undo is possible, else 'off'.
        end

        function hasUnsaved = hasUnsavedChanges(self)
        % Checks if the UI has unsaved layout changes.
        end

        function title = title(self)
        % Formats the figure title.
        end

        function onHistoryChange(self, ~, ~)
        % Called when commands are applied to the config.
        end

        function saveToFile(self, fileName)
        % Saves the config to the specified fileName.
        end

        function loadFromFile(self, fileName)
        % Loads the config at the specified fileName.
        end

        function redo(self)
        % Redoes the last undone command.
        end

        function undo(self)
        % Undoes the last command.
        end

    end

end