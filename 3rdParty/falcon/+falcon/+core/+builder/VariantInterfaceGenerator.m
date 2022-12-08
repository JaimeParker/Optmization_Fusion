classdef VariantInterfaceGenerator < falcon.core.Handle
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
    end

    methods
        function [cacheEntry, changed, hash] = generate(self)
        % Generate the variant interface and required subsystem functions.
        %  
        % <Description>
        % This method generates the subsystem functions with derivatives of
        % the specified order, and creates an interface function that takes
        % the arguments specified by setInputInfo() and returns the outputs
        % (with derivatives) given to the constructor.
        %  
        % <Outputs>
        % > cacheEntry: a falcon.core.builder.DerivativeCacheEntry instance
        %               that provides (depending on the specified
        %               derivative order) a function for
        %               value/Jacobian/Hessian
        % > changed: logical flag indicating if cached functions were used
        % > hash: system hash
        end

        function self = setInputInfo(self, info)
        % Specify system inputs and their properties.
        %  
        % <Description>
        % Use this method to provide crucial information on the variant
        % system input variables.  All inputs listed by getInputs() need to
        % be included, though additional inputs can be specified (these
        % will be added to the function signature, but ignored).  The order
        % of inputs given here is arbitrary and defines the interface
        % function signature.
        %  
        % <Inputs>
        % > info: struct array with fields 'Name' (char), 'Derivative'
        %         (logical), 'Size' (cell array of numeric vectors),
        %         'VariableSize' (logical).
        end

        function inputs = getInputs(self)
        % Get a list of inputs required for the variant system.
        %  
        % <Output>
        % > inputs: cell array of variable names
        end

        function self = VariantInterfaceGenerator(systemDefinition, cache, derivativeOrder)
        % Create a variant interface generator object.
        %  
        % <Description>
        % Constructor.  Note that additional information on the system
        % inputs needs to be supplied later; call getInputs() to obtain a
        % list of relevant variable names, and use setInputInfo() to
        % specify the details of these variables.
        %  
        % <Inputs>
        % > systemDefinition: falcon.core.builder.VariantSystemDefinition
        %                     instance
        % > cache: falcon.core.builder.Cache instance
        % > derivativeOrder: one of {0, 1, 2}
        end

    end

end