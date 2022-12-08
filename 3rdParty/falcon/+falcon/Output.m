classdef Output < falcon.Constraint
    % The falcon.Output class is an optimization value container for model
    % output values values. It is derived from falcon.Constraint.

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
        % Whether this value is active or not.
        isActive
    end

    methods
        function valuesStruct = extractValuesStructFrom(obj, source)
        % Extract values struct from Problem or Phase.
        %  
        % <Syntax>
        % valuesStruct = outputArray.extractValuesStructFrom(source)
        %  
        % <Description>
        % Extract the values of the given outputs from a Problem or Phase,
        % returning a struct for name-based access.
        %  
        % <Inputs>
        % > source: a falcon.Problem or falcon.Phase
        %  
        % <Outputs>
        % > valuesStruct: a struct;
        %                 fields: output names,
        %                 values: samples (row vectors)
        end

        function values = extractValuesFrom(obj, source)
        % Extract values array from Problem or Phase.
        %  
        % <Syntax>
        % values = outputArray.extractValuesFrom(source)
        %  
        % <Description>
        % Extract the values of the given outputs from a Problem or Phase.
        %  
        % <Inputs>
        % > source: a falcon.Problem or falcon.Phase
        %  
        % <Outputs>
        % > values: an array of output values;
        %           rows: states, columns: samples
        end

        function obj = Output(name, varargin)
        % Constructor for falcon.Output object. Each output needs to have at
        % least a valid name.
        %  
        % <Syntax>
        % obj = falcon.Output(name)
        % obj = falcon.Output(name, lowerBound)
        % obj = falcon.Output(name, lowerBound, upperBound)
        % obj = falcon.Output(name, lowerBound, upperBound, scaling)
        % obj = falcon.Output(name, lowerBound, upperBound, scaling, offset)
        % obj = falcon.Output(name, lowerBound, upperBound, scaling, offset, 'Active', true)
        % obj = falcon.Output(name, 'Name', Value)
        %  
        % <Input Arguments>
        % >name: The name of this model output object.
        % >lowerBound: The lower boundary for this constraint. (default: -inf)
        % >upperBound: The upper boundary for this constraint. (default: inf)
        % >scaling: The scaling factor for this constraint. (default: 1)
        % >offset: The offset value for this constraint. (default: 0)
        % >active: true or false, determines whether this constraint is
        % respected in the optimization or not. (default: true)
        %  
        % <Keywords>
        % Constructor!Output
        end

        function strc = ToStruct(obj, varargin)
        % Create a struct from this constraint.
        %  
        % <Syntax>
        % strc = obj.ToStruct()
        %  
        % <Description>
        % Extracts all relevant information from this constraint and stores it
        % in the returned struct.
        %  
        % <NameValue>
        % >DebugData: Setting this option to true enables debug data in
        %   the ToStruct method.
        %  
        % <Keywords>
        % Debugging!Constraint
        end

        function arr = ArrayWith(names, varargin)
        % Create array of falcon.Constraint objects
        %  
        % <Syntax>
        % arr = falcon.Constraint.ArrayWith(names)
        % arr = falcon.Constraint.ArrayWith(names,LowerBound)
        % arr = falcon.Constraint.ArrayWith(names,LowerBound,UpperBound)
        % arr = falcon.Constraint.ArrayWith(names,LowerBound,UpperBound,Scaling)
        % arr = falcon.Constraint.ArrayWith(names,LowerBound,UpperBound,Scaling,Offset)
        % arr = falcon.Constraint.ArrayWith(names,LowerBound,UpperBound,Scaling,Offset,Active)
        %  
        % <Description>
        % Creates an array of falcon.Constraint objects. This method is
        % to a shortcut to create a vector of the constraint objects
        % without creating each object individually.
        %  
        % <Inputs>
        % > names: The names of the falcon.Constraint object as a cell
        % array.
        %  
        % <Optional>
        % > LowerBound: The sorted lower bounds of the constraint object.
        % The size needs to match the number of constraint names.
        % > UpperBound: The sorted upper bounds of the constraint object.
        % The size needs to match the number of constraint names.
        % > Scaling: The sorted scalings of the constraint object.
        % The size needs to match the number of constraint names.
        % > Offset: The sorted offsets of the constraint object.
        % The size needs to match the number of constraint names.
        % > Active: The sorted active flags of the constraint object.
        % The size needs to match the number of constraint names.
        %  
        % <Keywords>
        % Constraint!Array
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

        function setActive(obj, active)
        % Sets the isActive property of this object.
        %  
        % <Syntax>
        % obj.setActive(isActive)
        %  
        % <Description>
        % Set whether this object is active. In case the object is not
        % active it will be ignored during optimization.
        %  
        % <Inputs>
        % isActive: Boolean to check if this object is active or not.
        %  
        % <Keywords>
        % Flags!Active
        end

    end

end