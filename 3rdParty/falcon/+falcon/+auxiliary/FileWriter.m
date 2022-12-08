classdef FileWriter < falcon.core.Handle
    % -------------------------------------------------------------------------
    %                                FALCON.m
    % Copyright (c) 2014-2019 Institute of Flight System Dynamics, TUM, Munich
    % Matthias Bittner, Matthias Rieck, Maximilian Richter,
    % Benedikt Grueter, Johannes Diepolder, Florian Schwaiger,
    % Patrick Piprek, and Florian Holzapfel
    % Downloading, using, copying, or modifying FALCON.m code constitutes an
    % agreement to ALL of the terms of the FALCON.m EULA.
    % -------------------------------------------------------------------------

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
        % falcon.auxiliary.FileWriter/File is a property.
        File
        % falcon.auxiliary.FileWriter/Indentation is a property.
        Indentation
        % falcon.auxiliary.FileWriter/IndentationLevel is a property.
        IndentationLevel
        % falcon.auxiliary.FileWriter/LineBreak is a property.
        LineBreak
        % Echo -  for convenient debugging
        Echo
    end

    methods
        function self = close(self)
        % CLOSE  Close figure.
        %   CLOSE(H) closes the window with handle H.
        %   CLOSE, by itself, closes the current figure window.
        %  
        %   CLOSE('name') closes the named window.
        %  
        %   CLOSE ALL  closes all figure windows whose handles are not hidden.
        %   CLOSE ALL HIDDEN  closes hidden windows as well.
        %   CLOSE ALL FORCE  unconditionally closes all windows by deleting them
        %   without executing the close request function.
        %  
        %   STATUS = CLOSE(...) returns 1 if the specified windows were closed
        %   and 0 otherwise.
        end

        function self = writeLine(self, format, varargin)
        % falcon.auxiliary.FileWriter/writeLine is a function.
        %   [self] = writeLine(self, format, varargin)
        end

        function self = write(self, format, varargin)
        % falcon.auxiliary.FileWriter/write is a function.
        %   [self] = write(self, format, varargin)
        end

        function self = setIndentationLevel(self, level)
        % falcon.auxiliary.FileWriter/setIndentationLevel is a function.
        %   [self] = setIndentationLevel(self, level)
        end

        function self = indent(self)
        % falcon.auxiliary.FileWriter/indent is a function.
        %   [self] = indent(self)
        end

        function self = indentLess(self)
        % falcon.auxiliary.FileWriter/indentLess is a function.
        %   [self] = indentLess(self)
        end

        function self = indentMore(self)
        % falcon.auxiliary.FileWriter/indentMore is a function.
        %   [self] = indentMore(self)
        end

        function self = withIndentation(self, str, width)
        % falcon.auxiliary.FileWriter/withIndentation is a function.
        %   [self] = withIndentation(self, str, width)
        end

        function self = withFile(self, fileOrPath, mode)
        % falcon.auxiliary.FileWriter/withFile is a function.
        %   [self] = withFile(self, fileOrPath, mode)
        end

        function obj = FileWriter()
        % -------------------------------------------------------------------------
        %                                FALCON.m
        % Copyright (c) 2014-2019 Institute of Flight System Dynamics, TUM, Munich
        % Matthias Bittner, Matthias Rieck, Maximilian Richter,
        % Benedikt Grueter, Johannes Diepolder, Florian Schwaiger,
        % Patrick Piprek, and Florian Holzapfel
        % Downloading, using, copying, or modifying FALCON.m code constitutes an
        % agreement to ALL of the terms of the FALCON.m EULA.
        % -------------------------------------------------------------------------
        end

    end

end