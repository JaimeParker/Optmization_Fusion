classdef PointFunction < falcon.core.PathFunction
    % Container for event constraint functions

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
        % The relevant phases for this pointfunction
        RelevantPhases
        % The relevant state grid indices for this pointfunction
        RelevantStateGridIndices
        % The relevant normalized times for this grid
        RelevantNormalizedTimeSteps
        % The phase this falcon.core.PathFunction belongs to
        Phase
        % Functionhandle to the function to be called
        FunctionHandle
        % The struct keeping the information about the inputs and outputs of the
        % used function.
        FunctionInfoStruct
        % Grids for the outputs of the path function. In case of a path function
        % the time points are also used for the inputs.
        OutputGrid
        % Relevant parameters
        Parameters
        % Relevant constants
        Constants
        % The indices of the states required for this function
        RelevantStateIndices
        % The indices of the controls required for this function
        RelevantControlIndices
        % The indices of the model outputs required for this function
        RelevantModelOutputIndices
        % The indices of the function parameters required by this
        % function. Sorts the Parameters of the function to the
        % parameters of the derivative model.
        RelevantParameterIndices
        % The multipliers of the output constraints for the Hamiltonian of the
        % problem.
        OutputMultipliers
    end

    methods
        function strc = ToStruct(obj, varargin)
        % Create a struct of this PathFunction object.
        %  
        % <Syntax>
        % strc = obj.ToStruct()
        %  
        % <Description>
        % This metod creates a struct of the falcon.core.PathFunction-object
        % including all the necessary information of the path function.
        %  
        % <Inputs>
        % >obj: falcon.core.PathFunction-object to be transformed in a struct.
        %  
        % <Outputs>
        % >strc: struct containing the inherent properties of the falcon.core.PathFunction-object
        %  
        % <NameValue>
        % >DebugData: Setting this option to true enables debug data in
        %   the ToStruct method.
        %  
        % <Keywords>
        % Debugging!Path Function
        end

        function overwriteConstants(obj, ConstantsCell, ConstantsIdx)
        % Overwrites the given numbers in the list of constants used
        % in this PathFunction.
        %  
        % <Syntax>
        % obj.overwriteConstants(Constant,...)
        %  
        % <Description>
        % Overwrites the given cell of constants in the list of
        % constants relevant for this PathFunction.
        %  
        % <Inputs>
        % > ConstantsCell: A cell of constant numbers used in this
        % PathFunction.
        % > ConstantsIdx: An array of the size of constants cell
        % containing the indices of the constants that should be
        % overwritten.
        %  
        % <Keywords>
        % Path Function!Overwrite Constants
        end

        function addConstants(obj, varargin)
        % Add the given numbers to the list of constants used in this PathFunction.
        %  
        % <Syntax>
        % obj.addConstants(Constant1, Constant2, ..)
        %  
        % <Description>
        % Adds the given array of constants to the list of constants relevant for
        % this PathFunction.
        %  
        % <Inputs>
        % > Constant1: An array of constant numbers used in this
        % PathFunctionfor the first constant.
        % > Constant2: An array of constant numbers used in this
        % PathFunctionfor the second constant.
        % > INFO: Note that the third matrix dimension for constants
        % with MultipleTimeEvaluation set to true contains the
        % evolution over the time steps, i.e., constants of size [n,m]
        % for each discretization step in the phase.
        %  
        % <Keywords>
        % Path Function!Constants
        end

        function setParameters(obj, Parameters)
        % Set the given parameters as the parameters required in this PathFunction.
        %  
        % <Syntax>
        % obj.setParameters(Parameters)
        %  
        % <Description>
        % Sets the given array of parameters as the parameters relevant for this
        % PathFunction. All parameters given here will be used as the thrid
        % input to the PathFunction.
        %  
        % <Inputs>
        % > Parameters: An array of falcon.Parameter objects used in this
        % PathFunction.
        %  
        % <Keywords>
        % Path Function!Parameters
        end

    end

end