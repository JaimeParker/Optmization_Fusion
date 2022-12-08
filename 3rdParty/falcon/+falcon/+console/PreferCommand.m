classdef PreferCommand < falcon.console.Command
    % Chooses preferences. The choice affects template contents.
    %  
    % <Syntax>
    % ####{regexprep(evalc('falcon help prefer'), {'\s+$', '\n', '<.*?>'}, {'', ['\n    % '], ''})}####
    %  
    % <Keywords>
    % Command!Prefer;falcon

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
        % The command signature describes all parsed and options.
        % Elements are space-separated tokens, that may include:
        % > name
        % > namePart1:namePart2
        % > <arg>
        % > <arrayArgWithEmptyCellDefault*>
        % > <optionalArgWithEmptyCharDefault?>
        % > <optionalArgWith=default>
        % > [--logicalParameter]
        % > [--valuedParameter=default]
        % > [--x|logicalParameterWithXShorthand]
        % > [--y|valuedParameterWithYShorthand=default]
        %  
        % E.g.: "make:test <name> [--i|injector]"
        Signature
        % One or more lines of description that are shown when the
        % command is either shown with --help or "falcon help <name>"
        % is called. Do not exceed typical line length.
        CommandHelp
        % 2D Cell array of argument and parameter help. The first column
        % is the name of the argument or parameter. The second column
        % is its documentation. Refer to the implementation of the
        % subclasses how to best define this property.
        ArgumentHelp
    end

    methods
        function varargout = call(self, args)
        % falcon.console.PreferCommand/call is a function.
        %   varargout = call(self, args)
        end

        function args = validate(~, args)
        % stub, subclass to customize logic
        end

        function self = PreferCommand(preferences)
        % Chooses preferences. The choice affects template contents.
        %  
        % <Syntax>
        % ####{regexprep(evalc('falcon help prefer'), {'\s+$', '\n', '<.*?>'}, {'', ['\n    % '], ''})}####
        %  
        % <Keywords>
        % Command!Prefer;falcon
        end

        function varargout = run(self, cellArgs)
        % This is invoked directly by the falcon() tool.
        end

    end

end