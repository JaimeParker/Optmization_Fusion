classdef DerivativeWrapperCol < falcon.core.builder.DerivativeWrapper
    % DERIVATIVEMODELWRAPPERCOL Summary of this class goes here
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
        % falcon.core.builder.FileWriter/FileID is a property.
        FileID
        % falcon.core.builder.FileWriter/IdentCount is a property.
        IdentCount
        % falcon.core.builder.FileWriter/IndentationText is a property.
        IndentationText
    end

    methods
        function WriteMexWrapper(obj, varargin)
        % WRITEMEXWRAPPER Summary of this function goes here
        %   Detailed explanation goes here
        end

        function WriteWrapper(obj)
        % falcon.core.builder.DerivativeWrapperCol/WriteWrapper is a function.
        %   WriteWrapper(obj)
        end

        function obj = DerivativeWrapperCol(ModelCoder)
        % DERIVATIVEMODELWRAPPERCOL Summary of this class goes here
        %   Detailed explanation goes here
        end

        function str = logical2str(~, b)
        % falcon.core.builder.FileWriter/logical2str is a function.
        %   str = logical2str(~, b)
        end

        function closesection(obj)
        % falcon.core.builder.FileWriter/closesection is a function.
        %   closesection(obj)
        end

        function opensection(obj)
        % falcon.core.builder.FileWriter/opensection is a function.
        %   opensection(obj)
        end

        function identdown(obj)
        % falcon.core.builder.FileWriter/identdown is a function.
        %   identdown(obj)
        end

        function identup(obj)
        % falcon.core.builder.FileWriter/identup is a function.
        %   identup(obj)
        end

        function writecommentline(obj, str, varargin)
        % falcon.core.builder.FileWriter/writecommentline is a function.
        %   writecommentline(obj, str, varargin)
        end

        function writemexprintfline(obj, str, varargin)
        % falcon.core.builder.FileWriter/writemexprintfline is a function.
        %   writemexprintfline(obj, str, varargin)
        end

        function writeMultiLine(obj, lines, varargin)
        % falcon.core.builder.FileWriter/writeMultiLine is a function.
        %   writeMultiLine(obj, lines, varargin)
        end

        function writeline(obj, str, varargin)
        % falcon.core.builder.FileWriter/writeline is a function.
        %   writeline(obj, str, varargin)
        end

        function writelinestart(obj, str, varargin)
        % falcon.core.builder.FileWriter/writelinestart is a function.
        %   writelinestart(obj, str, varargin)
        end

        function writestr(obj, str, varargin)
        % falcon.core.builder.FileWriter/writestr is a function.
        %   writestr(obj, str, varargin)
        end

        function setFileID(obj, fileID)
        % falcon.core.builder.FileWriter/setFileID is a function.
        %   setFileID(obj, fileID)
        end

    end

end