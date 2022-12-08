classdef DerivativeMatlabConfiguration < falcon.core.builder.DerivativeEvaluatorConfiguration
    % Configuration for the DerivativeMatlab evaluation provider

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
        % falcon.core.builder.DerivativeMatlabConfiguration/SymbolicEval is a property.
        SymbolicEval
        % falcon.core.builder.DerivativeMatlabConfiguration/OutputTable is a property.
        OutputTable
        % Enable multi-threaded model evaluation
        MultiThreading
        % Level of detail for output during the build process
        PrintLevel
        % Model output directory
        OutputDirectory
        % Builder-specific code generation diretory name
        CodeDirectoryName
    end

    methods
        function name = char(~)
        % Return the code generation directory name.
        %  
        % <Description>
        % For backward-compatibility.
        end

        function evaluationProvider = createEvaluationProvider(self, derivativeProvider)
        % falcon.core.builder.DerivativeMatlabConfiguration/createEvaluationProvider is a function.
        %   [evaluationProvider] = createEvaluationProvider(self, derivativeProvider)
        end

        function self = withOutputTable(self, outputTable)
        % falcon.core.builder.DerivativeMatlabConfiguration/withOutputTable is a function.
        %   [self] = withOutputTable(self, outputTable)
        end

        function self = DerivativeMatlabConfiguration()
        % Configuration for the DerivativeMatlab evaluation provider
        end

        function name = string(self)
        % Return the code generation directory name.
        %  
        % <Description>
        % For backward-compatibility.
        end

        function self = checkValid(self)
        % Check configuration consistency, fail if invalid
        %  
        % <Syntax>
        % config = config.checkValid()
        %  
        % <Description>
        % Raise an exception unless isValid().
        end

        function flag = isValid(self)
        % Check configuration consistency
        %  
        % <Syntax>
        % flag = config.isValid()
        %  
        % <Description>
        % This runs basic consistency checks.
        %  
        % <Outputs>
        % > flag: logical, true if valid
        end

    end

end