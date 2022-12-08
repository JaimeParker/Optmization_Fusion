classdef DerivativeArgumentMap
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
        % Total number of arguments
        ArgCount
        % Total number of arguments with derivative elements
        DiffArgCount
        % Argument is derivative argument
        ArgIsDiffArg
        % Map from derivative argument index to argument index
        DiffArgToArg
        % Total number of elements
        ElemCount
        % Number of elements by argument
        ElemCountByArg
        % Map from element index to argument index
        ElemToArg
        % Map from element index to index within argument
        ElemToInd
        % Total number of derivative elements
        DiffElemCount
        % Number of derivative elements by argument index
        DiffElemCountByArg
        % Offset of the derivative elements of each argument
        DiffElemOffsetByArg
        % Map from derivative element index to argument index
        DiffElemToArg
        % Map from derivative element index to index within argument
        DiffElemToInd
        % Total number of derivative elements with linear influence
        LinearDiffElemCount
        % Derivative elements with linear influence by argument index
        LinearDiffElemIndByArg
        % Derivative elements with linear influence
        DiffElemIsLinear
        % Total number of derivative elements with nonlinear influence
        NonlinearDiffElemCount
        % Derivative elements with nonlinear influence by argument index
        NonlinearDiffElemIndByArg
        % Derivative elements with nonlinear influence
        DiffElemIsNonlinear
    end

    methods
        function self = withLinearDiffElems(self, linearDiffElemsByArg)
        % falcon.core.builder.DerivativeArgumentMap/withLinearDiffElems is a function.
        %   [self] = withLinearDiffElems(self, linearDiffElemsByArg)
        end

        function self = DerivativeArgumentMap(argSize, isDiffArg)
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