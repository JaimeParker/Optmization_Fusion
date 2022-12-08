classdef Parameter < falcon.core.OVC & falcon.core.HasFixed & falcon.core.HasProblem
    % parameter values. It is derived from falcon.core.OVC with an expansion to set
    % the value fixed which means it will not be optimizable. Besides, it
    % has a value, an index and a sparse gradient.

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
        % The current value of this parameter
        Value
        % Index the index of this parameter in the z-Vector
        Index
        % Scaling Parameters initialized with 1. The offset
        % and scaling is assigned in the following way:
        %  
        % x_scaled = (x_unscaled - Offset) * Scaling
        Scaling
        % Offset parameter which is initialized with 0. The offset
        % and scaling is assigned in the following way:
        %  
        % x_scaled = (x_unscaled - Offset) * Scaling
        Offset
        % Name of object.
        Name
        % Lower bound of the falcon.core.OVC value. It is initialized with
        % minus infinity. Scaling and Offset are applied to the
        % LowerBound as well.
        LowerBound
        % Upper bound of the falcon.core.OVC value. It is initialized with
        % plus infinity. Scaling and Offset are applied to the
        % UpperBound as well.
        UpperBound
        % Whether this value is fixed or not.
        isFixed
    end

    methods
        function strc = ToStruct(obj, varargin)
        % Create a struct from this parameter.
        %  
        % <Syntax>
        % strc = obj.ToStruct()
        %  
        % <Description>
        % Extracts all relevant information from this parameter and stores it
        % in the returned struct.
        %  
        % <NameValue>
        % >DebugData: Setting this option to true enables debug data in
        %   the ToStruct method.
        %  
        % <Outputs>
        % >strc: struct containing the inherent properties of this object.
        %  
        % <Keywords>
        % Debugging!Parameter
        end

        function self = setValueAndRange(self, value, range)
        % falcon.Parameter/setValueAndRange is a function.
        %   [self] = setValueAndRange(self, value, range)
        end

        function self = setValueAndBounds(self, value, lowerBound, upperBound)
        % falcon.Parameter/setValueAndBounds is a function.
        %   [self] = setValueAndBounds(self, value, lowerBound, upperBound)
        end

        function obj = setValue(obj, Value)
        % Sets the current value of this falcon.Parameter.
        %  
        % <Syntax>
        % obj.setValue(Value)
        %  
        % <Description>
        % Sets the current value of this parameter to the given value.
        %  
        % <Inputs>
        % > Value: The numeric value of this parameter. Needs to be scalar.
        %  
        % <Keywords>
        % Parameter!Value
        end

        function obj = Parameter(name, varargin)
        % Constructor for falcon.Parameter object. Each parameter needs to have at
        %  
        % <Syntax>
        % obj = falcon.Parameter(name)
        % obj = falcon.Parameter(name, value)
        % obj = falcon.Parameter(name, value, lowerBound)
        % obj = falcon.Parameter(name, value, lowerBound, upperBound)
        % obj = falcon.Parameter(name, value, lowerBound, upperBound, scaling)
        % obj = falcon.Parameter(name, value, lowerBound, upperBound, scaling, offset)
        % obj = falcon.Parameter(name, value, lowerBound, upperBound, scaling, offset, Fixed)
        % obj = falcon.Parameter(name, value, lowerBound, upperBound, scaling, offset, Fixed, Sensitive)
        % obj = falcon.Parameter(..., 'Name', Value)
        %  
        % <Inputs>
        % > Value: The current (initial) value of this parameter. (default: 0)
        % > LowerBound: The lower boundary for this parameter. (default: -inf)
        % > UpperBound: The upper boundary for this parameter. (default: inf)
        % > Scaling: The scaling factor for this parameter. (default: 1)
        % > Offset: The offset value for this parameter. (default: 0)
        % > Fixed: true or false, determines whether this parameter is subject to
        % optimization or not. (default: false)
        % > Sensitive: true or false, determines whether this parameter is
        % used within the sensitivity analysis or not. (default: false)
        %  
        % <Keywords>
        % Constructor!Parameter
        end

        function obj = setOffset(obj, offset)
        % Set the offset of this object.
        %  
        % <Syntax>
        % obj.setOffset(offset)
        %  
        % <Description>
        % Set the offset of this object. Please note
        % that the input must be a real, scalar value.
        %  
        % <Inputs>
        % >offset: Offset of this object.
        %  
        % <Keywords>
        % OVC!Offset
        end

        function obj = setScaling(obj, scaling)
        % Set the scaling of this object.
        %  
        % <Syntax>
        % obj.setScaling(scaling)
        %  
        % <Description>
        % The input must be a real positive scalar value and should
        % scale the value of this object to a range between -1 and 1.
        %  
        % <Inputs>
        % >scaling: Scaling of the this object.
        %  
        % <Keywords>
        % OVC!Scaling
        end

        function element = findFirst(self, pattern)
        % Find the first element matching a regex.
        %  
        % <Syntax>
        % element = array.findFirst(pattern)
        %  
        % <Description>
        % Extract the first element from the array whose Name attribute
        % matches the given pattern, as determined by the regexp function.
        % If no element matches, an exception is thrown.
        %  
        % <Inputs>
        % > pattern: see documentation for regexp
        %  
        % <Outputs>
        % > element: the first matching element
        end

        function elements = find(self, pattern)
        % Find elements matching a regex.
        %  
        % <Syntax>
        % elements = array.find(pattern)
        %  
        % <Description>
        % Extract object array elements whose Name attributes match the
        % given pattern, as determined by the regexp function.  The
        % returned array is empty if no element matches.
        %  
        % <Inputs>
        % > pattern: see documentation for regexp
        %  
        % <Outputs>
        % > elements: the entries of the object array whose names match
        end

        function bool = ne(varargin)
        % ~= (NE)   Not equal relation for handles.
        %   Handles are equal if they are handles for the same object and are 
        %   unequal otherwise.
        %  
        %   H1 ~= H2 performs element-wise comparisons between handle arrays H1 
        %   and H2.  H1 and H2 must be of the same dimensions unless one is a 
        %   scalar.  The result is a logical array of the same dimensions, where 
        %   each element is an element-wise equality result.
        %  
        %   If one of H1 or H2 is scalar, scalar expansion is performed and the 
        %   result will match the dimensions of the array that is not scalar.
        %  
        %   TF = NE(H1, H2) stores the result in a logical array of the same
        %   dimensions.
        end

        function bool = eq(varargin)
        % == (EQ)   Test handle equality.
        %   Handles are equal if they are handles for the same object.
        %  
        %   H1 == H2 performs element-wise comparisons between handle arrays H1 and
        %   H2.  H1 and H2 must be of the same dimensions unless one is a scalar.
        %   The result is a logical array of the same dimensions, where each
        %   element is an element-wise equality result.
        %  
        %   If one of H1 or H2 is scalar, scalar expansion is performed and the 
        %   result will match the dimensions of the array that is not scalar.
        %  
        %   TF = EQ(H1, H2) stores the result in a logical array of the same 
        %   dimensions.
        end

        function map = byNameUnique(self)
        % Get a struct for name based access to the object array, allowing
        % only unique names.
        %  
        % <Syntax>
        % [ map ] = obj.byNameUnique()
        %  
        % <Description>
        % The method returns all entries from the object array 'obj' as
        % fields of a struct, with the object Name as field name.  Throws
        % an error in case there are any duplicate names.
        %  
        % <Keywords>
        % OVC!byName!Unique
        end

        function map = byName(self)
        % Get a struct for name based access to the object array.
        %  
        % <Syntax>
        % [ map ] = obj.byName()
        %  
        % <Description>
        % The method returns all entries from the object array 'obj' as
        % fields of a struct, with the object Name as field name.  In case
        % there are duplicate names, the output struct contains object
        % arrays.
        %  
        % <Keywords>
        % OVC!byName
        end

        function self = relaxRange(self, range)
        % Relax the lower and upper bound.
        %  
        % <Syntax>
        % obj.relaxRange(range)
        %  
        % <Description>
        % For current bounds [a, b] and given bounds [c, d], set the bounds
        % to [min(a, c), max(b, d)].
        %  
        % <Inputs>
        % > range: two-element double vector
        end

        function self = relaxBounds(self, lowerBound, upperBound)
        % Relax the lower and upper bound.
        %  
        % <Syntax>
        % obj.relaxBounds(lowerBound, upperBound)
        %  
        % <Description>
        % For current bounds [a, b] and given bounds [c, d], set the bounds
        % to [min(a, c), max(b, d)].
        %  
        % <Inputs>
        % > lowerBound: scalar double
        % > upperBound: scalar double
        end

        function self = tightenRange(self, range)
        % Tighten the lower and upper bound.
        %  
        % <Syntax>
        % obj.tightenRange(range)
        %  
        % <Description>
        % For current bounds [a, b] and given bounds [c, d], set the bounds
        % to [max(a, c), min(b, d)].
        %  
        % <Inputs>
        % > range: two-element double vector
        end

        function self = tightenBounds(self, lowerBound, upperBound)
        % Tighten the lower and upper bound.
        %  
        % <Syntax>
        % obj.tightenBounds(lowerBound, upperBound)
        %  
        % <Description>
        % For current bounds [a, b] and given bounds [c, d], set the bounds
        % to [max(a, c), min(b, d)].
        %  
        % <Inputs>
        % > lowerBound: scalar double
        % > upperBound: scalar double
        end

        function self = setRange(self, range)
        % Set the lower and upper bound using a vector argument.
        %  
        % <Syntax>
        % obj.setRange(range)
        %  
        % <Description>
        % Set the lower and upper bound.
        %  
        % <Inputs>
        % > range: a two-element double vector
        end

        function self = setBounds(self, lowerBound, upperBound)
        % Set the lower and upper bound.
        %  
        % <Syntax>
        % obj.setBounds(lowerBound, upperBound)
        %  
        % <Description>
        % Set the lower and upper bound.
        %  
        % <Inputs>
        % > lowerBound: scalar double
        % > upperBound: scalar double
        end

        function obj = setUpperBound(obj, upperBound)
        % Set the upper bound of this object.
        %  
        % <Syntax>
        % obj.setUpperBound(upperBound)
        %  
        % <Description>
        % Set the upper bound of this object. The input must be a real, scalar
        % value and bigger than the lower bound.
        %  
        % <Inputs>
        % >upperBound: Upper bound of this object.
        %  
        % <Keywords>
        % OVC!Bound!Upper
        end

        function obj = setLowerBound(obj, lowerBound)
        % Set the lower bound of this object.
        %  
        % <Syntax>
        % obj.setLowerBound(lowerBound)
        %  
        % <Description>
        % Set the lower bound of this object. The input must be a real, scalar
        % scalar and smaller than the upper bound.
        %  
        % <Inputs>
        % >lowerBound: Lower bound of this object.
        %  
        % <Keywords>
        % OVC!Bound!Lower
        end

        function obj = setFixed(obj, fixed)
        % Sets the isFixed property of this object. Fixed objects will
        % not be optimized.
        %  
        % <Syntax>
        % obj.setFixed(fixed)
        %  
        % <Description>
        % Sets if this object can be optimized or not.
        %  
        % <Inputs>
        % > fixed: A scalar boolean specifying if the object is fixed or not. Fixed
        % objects are not subject to optimization.
        %  
        % <Keywords>
        % Flags!Fixed
        end

    end

end