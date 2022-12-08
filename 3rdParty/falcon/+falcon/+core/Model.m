classdef Model < falcon.core.Handle & falcon.core.HasToStruct & falcon.core.HasProblem
    % Container for a phases of an optimal control problem

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
        % The phase this falcon.core.Model belongs to
        Phase
        % The grid for the state dot values
        StateDotGrid
        % The grid for the model outputs
        ModelOutputGrid
        % The grid for the simulated state dot values
        SimulatedStateDotGrid
        % The grid for the simulated model outputs
        SimulatedOutputGrid
        % Model calculate the dynamics either by using Model.Simulate()
        % for shooting methods or Model.Evaluate() for Collocation
        % methods
        ModelHandle
        % The struct holding all information about the model function.
        ModelInfoStruct
        % The parameters used in the simulation of the model
        ModelParameters
        % The constants used for the simulation of the model
        ModelConstants
        % The indices of the states to be integrated using the refined
        % multiple shooting grid.
        ShootingIndices
        % The indices of the states to be integrated using the coarse
        % collocation grid.
        SlowIndices
        % Flag that determines whether we have a real, physical output
        % of the system
        real_out_avail
        % PathFunction object generated for the output path constraints
        PathConstraintFunction
        % Specifies whether the Model has Outputs
        hasOutputs
    end

    methods
        function strc = ToStruct(obj, varargin)
        % Create a struct of the falcon.core.Model-object.
        %  
        % <Syntax>
        % strc = obj.ToStruct()
        %  
        % <Description>
        % This metod creates a struct of the falcon.core.Model-object
        % including all the necessary information of the Model.
        %  
        % <Inputs>
        % >obj: falcon.core.Model-object to be transformed in a struct.
        %  
        % <Outputs>
        % >strc: struct containing the inherent properties of the falcon.core.Model-object
        %  
        % <NameValue>
        % >DebugData: Setting this option to true enables debug data in
        %   the ToStruct method.
        %  
        % <Keywords>
        % Debugging!Model
        end

        function setModelOutputs(obj, Outputs)
        % Set the given falcon.Outputs as the outputs of the model.
        %  
        % <Syntax>
        % obj.setModelOutputs(Outputs)
        %  
        % <Description>
        % Sets the given array of falcon.Output objects as the outputs additional
        % outputs for the model. In case there are finite limits defined for the
        % outputs, the outputs are automatically limited to the respective values.
        %  
        % <Inputs>
        % > Outputs: An array of falcon.Output objects used to store the outputs of
        % the model.
        %  
        % <Keywords>
        % Model!Outputs
        end

        function overwriteConstants(obj, ConstantsCell, ConstantsIdx)
        % Overwrites the given numbers in the list of constants used
        % in this simulation model.
        %  
        % <Syntax>
        % obj.overwriteConstants(Constant,...)
        %  
        % <Description>
        % Overwrites the given cell of constants in the list of
        % constants relevant for this simulation model.
        %  
        % <Inputs>
        % > ConstantsCell: A cell of constant numbers used in this
        % PathFunction.
        % > ConstantsIdx: An array of the size of constants cell
        % containing the indices of the constants that should be
        % overwritten.
        %  
        % <Keywords>
        % Model!Overwrite Constants
        end

        function addModelConstants(obj, varargin)
        % Add the given numbers to the list of constants used in the simulation
        % model.
        %  
        % <Syntax>
        % obj.addModelConstants(Constant1, Constant2, ..)
        %  
        % <Description>
        % Adds the given array of constants to the list of constants relevant for
        % the simulation model.
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
        % Model!Constants
        end

        function setModelParameters(obj, Parameters)
        % Set the given parameters as the parameters used in the simulation model.
        %  
        % <Syntax>
        % obj.setModelParameters(Parameters)
        %  
        % <Description>
        % Sets the given array of parameters as the parameters relevant for the
        % simulation model. All parameters given here will be used as the thrid
        % input to the simulation model dynamics.
        %  
        % <Inputs>
        % > Parameters: An array of falcon.Parameter objects used in the simulation of
        % the dynamic model.
        %  
        % <Keywords>
        % Model!Parameters
        end

    end

end