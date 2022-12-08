classdef Grid < falcon.core.HasProblem & falcon.core.HasToStruct & falcon.core.Handle
    % Class to hold a time grid of values required in an optimal control
    % problem

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
        % Constant used to set the linear grid interpolation method
        GRID_INTERPOLATION_LINEAR
        % Constant used to set the previous grid interpolation method
        GRID_INTERPOLATION_PREVIOUS
        % The phase this falcon.core.Grid belongs to
        Phase
        % Array to hold the datatypes of this grid
        DataTypes
        % The type of this grid. Valid types are listed in the field
        % ValidTypes
        Type
        % The time history values stored in the grid
        Values
        % The normalized time points of this grid
        NormalizedTime
        % The indices of this grid in either z or f
        Index
        % The indices of the final boundary condition for the multiple
        % shooting in the f vector
        FBCIndex
        % Jacobian Gradient of the Grid
        Jacobian
        % Hessian Gradient of the Grid
        Hessian
        % The gradient of the interpolation scheme of this grid
        InterpolationGradient
        % The interpolation method for this grid
        InterpolationMethod
        % The indices that are neither fixed nor disabled. RelevantIndices holds
        % the indices of the states as numerical values (not logical).
        RelevantIndices
        % The indices of the points in time in this grid with respect to the
        % stategrid of the respective phase
        StateGridIndices
        % Allow the grid to be resampled in-place?
        ResamplingEnabled
        % (dependent) The upper bounds of the values
        UpperBounds
        % (dependent) The lower bounds of the values
        LowerBounds
        % (dependent) The scaling of the values
        Scaling
        % (dependent) The offsets of the values
        Offset
        % (dependent) The names for the values
        Name
        % (dependent) The names for the values as a string
        NameStr
    end

    methods
        function location = findVariables(self, variables)
        % Find variables in the grid.
        %  
        % <Syntax>
        % [ location ] = grid.findVariables(variables)
        %  
        % <Description>
        % This returns the indices of the given variables in the grid.  If
        % any given variable is not found, an exception is thrown.
        %  
        % <Inputs>
        % > variables: variable name(s) or falcon.State/falcon.Control/...
        %              array; entries are always matched by name
        %  
        % <Outputs>
        % > location: numeric index vector
        end

        function self = copyDistributedAttributesFrom(self, other)
        % Copy distributed variable attributes from another grid
        %  
        % <Syntax>
        % grid.copyDistributedAttributesFrom(self, other)
        %  
        % <Description>
        % Copy the variable attributes LowerBound, UpperBound, Scaling,
        % Offset (distributed over normalized time) from another grid,
        % interpolating onto the current normalized time grid.  Variables
        % are matched by name.
        end

        function values = getDistributedOffsets(self, variables)
        % Get offsets varying over normalized time.
        %  
        % <Syntax>
        % [ values ] = grid.getDistributedOffsets()
        % [ values ] = grid.getDistributedOffsets(variables)
        %  
        % <Description>
        % Extract the offsets depending on normalized time from the grid.
        % The returned values are NaN for those samples where no
        % distributed value has been specified, i.e., where the global
        % variable attributes are used.
        %  
        % <Inputs>
        % > variables: optional variable name(s) or
        %   falcon.State/falcon.Control/... array; entries are matched by
        %   name
        %  
        % <Outputs>
        % > values: distributed values (one row per variable)
        end

        function values = getDistributedScalings(self, variables)
        % Get scalings varying over normalized time.
        %  
        % <Syntax>
        % [ values ] = grid.getDistributedScalings()
        % [ values ] = grid.getDistributedScalings(variables)
        %  
        % <Description>
        % Extract the scalings depending on normalized time from the grid.
        % The returned values are NaN for those samples where no
        % distributed value has been specified, i.e., where the global
        % variable attributes are used.
        %  
        % <Inputs>
        % > variables: optional variable name(s) or
        %   falcon.State/falcon.Control/... array; entries are matched by
        %   name
        %  
        % <Outputs>
        % > values: distributed values (one row per variable)
        end

        function values = getDistributedUpperBounds(self, variables)
        % Get upper bounds varying over normalized time.
        %  
        % <Syntax>
        % [ values ] = grid.getDistributedUpperBounds()
        % [ values ] = grid.getDistributedUpperBounds(variables)
        %  
        % <Description>
        % Extract the upper bounds depending on normalized time from the
        % grid.  The returned values are NaN for those samples where no
        % distributed value has been specified, i.e., where the global
        % variable attributes are used.
        %  
        % <Inputs>
        % > variables: optional variable name(s) or
        %   falcon.State/falcon.Control/... array; entries are matched by
        %   name
        %  
        % <Outputs>
        % > values: distributed values (one row per variable)
        end

        function values = getDistributedLowerBounds(self, variables)
        % Get lower bounds varying over normalized time.
        %  
        % <Syntax>
        % [ values ] = grid.getDistributedLowerBounds()
        % [ values ] = grid.getDistributedLowerBounds(variables)
        %  
        % <Description>
        % Extract the lower bounds depending on normalized time from the
        % grid.  The returned values are NaN for those samples where no
        % distributed value has been specified, i.e., where the global
        % variable attributes are used.
        %  
        % <Inputs>
        % > variables: optional variable name(s) or
        %   falcon.State/falcon.Control/... array; entries are matched by
        %   name
        %  
        % <Outputs>
        % > values: distributed values (one row per variable)
        end

        function self = setDistributedOffsets(self, variables, normalizedTime, values)
        % Set offsets varying over normalized time.
        %  
        % <Syntax>
        % grid.setDistributedScalings(variables, normalizedTime, values)
        %  
        % <Description>
        % Set offsets that vary over normalized time.  These offsets
        % override the offsets specified globally for the given variables.
        % The values are interpolated linearly and affect only the given
        % normalized time interval.
        %  
        % <Inputs>
        % > variables: variable name(s) or falcon.State/falcon.Control/...
        %   array; entries are matched by name
        % > normalizedTime: vector of normalized time samples for the
        %   specified scalings
        % > values: offsets values (one row per variable)
        end

        function self = setDistributedScalings(self, variables, normalizedTime, values)
        % Set scalings varying over normalized time.
        %  
        % <Syntax>
        % grid.setDistributedScalings(variables, normalizedTime, values)
        %  
        % <Description>
        % Set scalings that vary over normalized time.  These scalings
        % override the scalings specified globally for the given variables.
        % The values are interpolated linearly and affect only the given
        % normalized time interval.
        %  
        % <Inputs>
        % > variables: variable name(s) or falcon.State/falcon.Control/...
        %   array; entries are matched by name
        % > normalizedTime: vector of normalized time samples for the
        %   specified scalings
        % > values: scaling values (one row per variable)
        end

        function self = setDistributedUpperBounds(self, variables, normalizedTime, values)
        % Set upper bounds varying over normalized time.
        %  
        % <Syntax>
        % grid.setDistributedUpperBounds(variables, normalizedTime, values)
        %  
        % <Description>
        % Set upper bounds that vary over normalized time.  These bounds
        % override the bounds specified globally for the given variables.
        % The values are interpolated linearly and affect only the given
        % normalized time interval.
        %  
        % <Inputs>
        % > variables: variable name(s) or falcon.State/falcon.Control/...
        %   array; entries are matched by name
        % > normalizedTime: vector of normalized time samples for the
        %   specified bounds
        % > values: bound values (one row per variable)
        end

        function self = setDistributedLowerBounds(self, variables, normalizedTime, values)
        % Set lower bounds varying over normalized time.
        %  
        % <Syntax>
        % grid.setDistributedLowerBounds(variables, normalizedTime, values)
        %  
        % <Description>
        % Set lower bounds that vary over normalized time.  These bounds
        % override the bounds specified globally for the given variables.
        % The values are interpolated linearly and affect only the given
        % normalized time interval.
        %  
        % <Inputs>
        % > variables: variable name(s) or falcon.State/falcon.Control/...
        %   array; entries are matched by name
        % > normalizedTime: vector of normalized time samples for the
        %   specified bounds
        % > values: bound values (one row per variable)
        end

        function strc = ToStruct(obj, varargin)
        % Create a struct of the falcon.core.Grid-object.
        %  
        % <Syntax>
        % strc = obj.ToStruct()
        %  
        % <Description>
        % This metod creates a struct of the falcon.core.Grid-object
        % including all the necessary information of the grid.
        %  
        % <Inputs>
        % >obj: falcon.core.Grid-object to be transformed in a struct.
        %  
        % <NameValue>
        % >DebugData: Setting this option to true enables debug data in
        %   the ToStruct method.
        %  
        % <Outputs>
        % >strc: struct containing the inherent properties of the falcon.core.Grid-object
        %  
        % <Keywords>
        % Debugging!Grid
        end

        function values = guessValuesFromBounds(self, normalizedTime)
        % falcon.core.Grid/guessValuesFromBounds is a function.
        %   [values] = guessValuesFromBounds(self, normalizedTime)
        end

        function resample(self, newNormalizedTime)
        % Resample the grid.
        %  
        % <Syntax>
        % grid.resample(newNormalizedTime)
        %  
        % <Description>
        % Updates the normalized time vector and interpolates the values
        % according to the grid's InterpolationMethod.
        %  
        % <Keywords>
        % Grid!Resample
        end

        function InterpValues = getInterpolatedValues(obj)
        % Method handing back the interpolated values of this grid
        %  
        % <Syntax>
        % InterpValues = getInterpolatedValues(obj)
        %  
        % <Description>
        % Interpolates and returns these interpolated values of the falcon.core.Grid
        % object.
        %  
        % <Outputs>
        % >InterpValues: Numeric array of the interpolated values for
        % this grid.
        %  
        % <Keywords>
        % Grid!Interpolation!Values
        end

        function setInterpolationMethod(obj, method)
        % Set the interpolation method for the control grid
        %  
        % <Syntax>
        % setInterpolationMethod(obj, method)
        %  
        % <Description>
        % Used to set the interpolation method
        %  
        % <Inputs>
        % >method: The interpolation methods supported by FALCON.m are
        % 'linear' and 'previous'. Alternatively, the class constants
        % GRID_INTERPOLATION_LINEAR and GRID_INTERPOLATION_PREVIOUS may
        % be used.
        %  
        % <Keywords>
        % Grid!Interpolation!Method
        end

        function setOnlySpecificValues(obj, setVariables, input1, input2, varargin)
        % Set the values of this grid.
        %  
        % <Syntax>
        % obj.setOnlySpecificValues(setVariables, ConstantValues)
        % obj.setOnlySpecificValues(setVariables, InitialValues, FinalValues)
        % obj.setOnlySpecificValues(setVariables, NormalizedTime, Values)
        % obj.setOnlySpecificValues(setVariables, RealTime, Values, 'Realtime', true)
        %  
        % <Description>
        % Used to set the initial guess for specific states. The values are
        % interpolated to the values needed in this grid using linear
        % interpolation with extrapolation turned on. All non-specified
        % values remain unchanged.
        %  
        % <Inputs>
        % > setStatesControls: falcon state/control object containing the
        % states/controls to be set
        % > ConstantValues: One vector of values copied to all points in
        % time.
        % > InitialValues: The value of this grid for normalized time tau=0. Needs to
        % have the exact same size as DataTypes.
        % > FinalValues: The value of this grid for normalized time tau=1. Needs to
        % have the exact same size as DataTypes.
        % > NormalizedTime: A list of points in normalized time for which the
        % values are given.
        % > Values: An array of size [numel(setStatesControls),
        % length(time)] holding the values to be stored in this grid.
        %  
        % <NameValue>
        % > Realtime: Switch to change the time vector from normalized time to real
        % time (default: false).
        %  
        % <Keywords>
        % Grid!Set Only!Specific Values
        end

        function setholdSpecificValues(obj, setStatesControls, holdStatesControls, input1, input2, varargin)
        % Set the values of this grid.
        %  
        % <Syntax>
        % obj.setholdSpecificValues(setStatesControls,holdStatesControls,ConstantValues)
        % obj.setholdSpecificValues(setStatesControls,holdStatesControls,InitialValues, FinalValues)
        % obj.setholdSpecificValues(setStatesControls,holdStatesControls,NormalizedTime, Values)
        % obj.setholdSpecificValues(setStatesControls,holdStatesControls,RealTime, Values, 'Realtime', true)
        %  
        % <Description>
        % Used to set the initial guess for specific states. Additionally, specific states can
        % also be set on hold and are not changed. The values are interpolated to the values
        % needed in this grid using linear interpolation with extrapolation turned
        % on. All non-specified values are set to NaN and
        % post-processed in the phase.checkConsistency function, where
        % they are set to the default values
        %  
        % <Inputs>
        % > setStatesControls: falcon state/control object containing the
        % states/controls to be set (can also be empty)
        % > holdStatesControls: falcon state/control object containing the
        % states/controls to be hold (i.e. not set to NaN) (can also be empty)
        % > ConstantValues: One vector of values copied to all points in
        % time.
        % > InitialValues: The value of this grid for normalized time tau=0. Needs to
        % have the exact same size as DataTypes.
        % > FinalValues: The value of this grid for normalized time tau=1. Needs to
        % have the exact same size as DataTypes.
        % > NormalizedTime: A list of points in normalized time for which the
        % values are given.
        % > Values: An array of size [DataTypes, length(time)] holding the values to
        % be stored in this grid.
        %  
        % <NameValue>
        % > Realtime: Switch to change the time vector from normalized time to real
        % time (default: false).
        %  
        % <Keywords>
        % Grid!Set and Hold!Specific Values
        end

        function setSpecificValues(obj, setStatesControls, input1, input2, varargin)
        % Set the values of this grid.
        %  
        % <Syntax>
        % obj.setSpecificValues(setStatesControls,ConstantValues)
        % obj.setSpecificValues(setStatesControls,InitialValues, FinalValues)
        % obj.setSpecificValues(setStatesControls,NormalizedTime, Values)
        % obj.setSpecificValues(setStatesControls,RealTime, Values, 'Realtime', true)
        %  
        % <Description>
        % Used to set the initial guess for specific states. The values are interpolated to the values
        % needed in this grid using linear interpolation with extrapolation turned
        % on. All non-specified values are set to NaN and
        % post-processed in the phase.checkConsistency function, where
        % they are set to the default values
        %  
        % <Inputs>
        % > setStatesControls: falcon state/control object containing the
        % states/controls to be set
        % > ConstantValues: One vector of values copied to all points in
        % time.
        % > InitialValues: The value of this grid for normalized time tau=0. Needs to
        % have the exact same size as DataTypes.
        % > FinalValues: The value of this grid for normalized time tau=1. Needs to
        % have the exact same size as DataTypes.
        % > NormalizedTime: A list of points in normalized time for which the
        % values are given.
        % > Values: An array of size [DataTypes, length(time)] holding the values to
        % be stored in this grid.
        %  
        % <NameValue>
        % > Realtime: Switch to change the time vector from normalized time to real
        % time (default: false).
        %  
        % <Keywords>
        % Grid!Set!Specific Values
        end

        function setValues(obj, input1, input2, varargin)
        % Set the values of this grid.
        %  
        % <Syntax>
        % obj.setValues(ConstantValues)
        % obj.setValues(InitialValues, FinalValues)
        % obj.setValues(NormalizedTime, Values)
        % obj.setValues(RealTime, Values, 'Realtime', true)
        %  
        % <Description>
        % Used to set the initial guess. The values are interpolated to the values
        % needed in this grid using linear interpolation with extrapolation turned
        % on.
        %  
        % <Inputs>
        % > ConstantValues: One vector of values copied to all points in
        % time.
        % > InitialValues: The value of this grid for normalized time tau=0. Needs to
        % have the exact same size as DataTypes.
        % > FinalValues: The value of this grid for normalized time tau=1. Needs to
        % have the exact same size as DataTypes.
        % > NormalizedTime: A list of points in normalized time for which the
        % values are given.
        % > Values: An array of size [DataTypes, length(time)] holding the values to
        % be stored in this grid.
        %  
        % <NameValue>
        % > Realtime: Switch to change the time vector from normalized time to real
        % time (default: false).
        %  
        % <Keywords>
        % Grid!Set!Values
        end

    end

end