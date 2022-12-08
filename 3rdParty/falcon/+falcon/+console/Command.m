classdef (Abstract) Command < handle
    % The base class for all console commands.
    %  
    % Console commands are registered to the "falcon" function automatically and
    % resolved based on their "Signature" property. In the Signature, the first
    % element is formatted like "group:name". That name is then resolved as
    % "falcon.console.GroupNameCommand". If that class exists, it is constructed
    % with the DI tool, then validate() and call(params) are invoked.
    %  
    % When you subclass Command, you need to specify "Signature", "CommandHelp"
    % (at least one short line) and "ArgumentHelp". "ArgumentHelp" may remain
    % empty {}, if no options or arguments are defined. In this class, the three
    % properties are defined as Abstract, so the user can specify them in the
    % properties section of the classdef. If they weren't, overriding the
    % properties would not be possible.
    %  
    % At the same time, yout must specify varargout = call(params), where params
    % is a struct() with the parsed arguments from the command line. Values are
    % typically all strings, you need to parse numeric values youself (i.e. use
    % str2double). The function should typically return zero arguments, but
    % there may be use cases where the user wants to have a value returned from
    % the command (i.e. called as "output = falcon('version')"). You can
    % determine how many outputs are requested by the user by checking nargout.
    %  
    % Arguments are parsed with their definition in the Signature property.
    % Arguments (defined with angle brackets) come first, options (defined
    % with square brackets) are last. When you define optional and array
    % arguments, pay attention to the order in which you specify them. Array
    % arguments will capture as many elements on the command line as possible,
    % before any options (starting with --) are defined. Therefore, put normal
    % arguments first, optionals second, and arrays last.
    %  
    % Options may come in any order, but must be defined after the arguments.
    % Options without default value are recognized as logical switches. If they
    % are defined, they resolve to true, else they are false by default. If a
    % value is defined, the parameter is parsed as a character vector. If it is
    % marked with an asterisk *, multiple arguments are captured into one cell
    % array of character vectors. If you add a shorthand (i.e. a single
    % character in front of the parameter name, separated by a vertical dash |),
    % e.g. as [-f|fullname] you may use the parameter either as --fullname or -f
    % when calling.

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
        function args = validate(self, args)
        % stub, subclass to customize logic
        end

        function varargout = run(self, cellArgs)
        % This is invoked directly by the falcon() tool.
        end

        function varargout = call(self, args)
        % falcon.console.Command/call is a function.
        %   obj = falcon.console.Command
        end

        function obj = Command()
        % The base class for all console commands.
        %  
        % Console commands are registered to the "falcon" function automatically and
        % resolved based on their "Signature" property. In the Signature, the first
        % element is formatted like "group:name". That name is then resolved as
        % "falcon.console.GroupNameCommand". If that class exists, it is constructed
        % with the DI tool, then validate() and call(params) are invoked.
        %  
        % When you subclass Command, you need to specify "Signature", "CommandHelp"
        % (at least one short line) and "ArgumentHelp". "ArgumentHelp" may remain
        % empty {}, if no options or arguments are defined. In this class, the three
        % properties are defined as Abstract, so the user can specify them in the
        % properties section of the classdef. If they weren't, overriding the
        % properties would not be possible.
        %  
        % At the same time, yout must specify varargout = call(params), where params
        % is a struct() with the parsed arguments from the command line. Values are
        % typically all strings, you need to parse numeric values youself (i.e. use
        % str2double). The function should typically return zero arguments, but
        % there may be use cases where the user wants to have a value returned from
        % the command (i.e. called as "output = falcon('version')"). You can
        % determine how many outputs are requested by the user by checking nargout.
        %  
        % Arguments are parsed with their definition in the Signature property.
        % Arguments (defined with angle brackets) come first, options (defined
        % with square brackets) are last. When you define optional and array
        % arguments, pay attention to the order in which you specify them. Array
        % arguments will capture as many elements on the command line as possible,
        % before any options (starting with --) are defined. Therefore, put normal
        % arguments first, optionals second, and arrays last.
        %  
        % Options may come in any order, but must be defined after the arguments.
        % Options without default value are recognized as logical switches. If they
        % are defined, they resolve to true, else they are false by default. If a
        % value is defined, the parameter is parsed as a character vector. If it is
        % marked with an asterisk *, multiple arguments are captured into one cell
        % array of character vectors. If you add a shorthand (i.e. a single
        % character in front of the parameter name, separated by a vertical dash |),
        % e.g. as [-f|fullname] you may use the parameter either as --fullname or -f
        % when calling.
        end

    end

end