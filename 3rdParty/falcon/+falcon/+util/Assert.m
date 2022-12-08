classdef Assert
    % ASSERT For checking of user inputs

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
        % falcon.util.Assert.ERR_INVALID_DIR is a property.
        ERR_INVALID_DIR
        % falcon.util.Assert.ERR_INVALID_INPUT is a property.
        ERR_INVALID_INPUT
        % falcon.util.Assert.ERR_INVALID_PLATFORM is a property.
        ERR_INVALID_PLATFORM
        % falcon.util.Assert.ERR_INVALID_SIZE is a property.
        ERR_INVALID_SIZE
        % falcon.util.Assert.ERR_FILE_SYSTEM is a property.
        ERR_FILE_SYSTEM
        % falcon.util.Assert.ERR_COMPILE is a property.
        ERR_COMPILE
        % falcon.util.Assert.ERR_NOT_YET_IMPLEMENTED is a property.
        ERR_NOT_YET_IMPLEMENTED
        % falcon.util.Assert.MSG_NOT_YET_IMPLEMENTED is a property.
        MSG_NOT_YET_IMPLEMENTED
        % falcon.util.Assert/Name is a property.
        Name
        % falcon.util.Assert/Value is a property.
        Value
        % falcon.util.Assert/ClassOfValue is a property.
        ClassOfValue
    end

    methods
        function obj = property(obj, name)
        % falcon.util.Assert/property is a function.
        %   obj = property(obj, name)
        end

        function obj = Assert(varargin)
        % Assert may take a ('name', value) pair or a named variable as input.
        % After construction, you may chain calls to .isXXX() for assertions.
        %  
        % <Syntax>
        % falcon.util.Assert('Solution', 42).isNumeric();
        % solution = 42;
        % falcon.util.Assert(solution).isNumeric();
        end

        function assertInvalidInput(boolCondition, strText, varargin)
        % falcon.util.Assert.assertInvalidInput is a function.
        %   falcon.util.Assert.assertInvalidInput(boolCondition, strText, varargin)
        end

        function assertAll(boolCondition, strMsgID, strText, varargin)
        % falcon.util.Assert.assertAll is a function.
        %   falcon.util.Assert.assertAll(boolCondition, strMsgID, strText, varargin)
        end

        function obj = isLogical(obj)
        % falcon.util.Assert/isLogical is a function.
        %   obj = isLogical(obj)
        end

        function obj = isHandle(obj)
        % falcon.util.Assert/isHandle is a function.
        %   obj = isHandle(obj)
        end

        function obj = isStruct(obj)
        % falcon.util.Assert/isStruct is a function.
        %   obj = isStruct(obj)
        end

        function obj = isa(obj, varargin)
        % ISA    Determine if input is object of specified class.
        %   ISA(obj,'ClassName') returns true if obj is an instance of the
        %   class specified by ClassName, and false otherwise. isa also returns
        %   true if obj is an instance of a class that is derived from ClassName.
        %   Classname must be a character vector or string scalar.
        %  
        %   Some possibilities for 'ClassName' are:
        %     double          -- Double precision floating point numeric array
        %                        (this is the traditional MATLAB matrix or array)
        %     single          -- Single precision floating-point numeric array
        %     logical         -- Logical array
        %     char            -- Character array
        %     int8            -- 8-bit signed integer array
        %     uint8           -- 8-bit unsigned integer array
        %     int16           -- 16-bit signed integer array
        %     uint16          -- 16-bit unsigned integer array
        %     int32           -- 32-bit signed integer array
        %     uint32          -- 32-bit unsigned integer array
        %     int64           -- 64-bit signed integer array
        %     uint64          -- 64-bit unsigned integer array
        %     cell            -- Cell array
        %     struct          -- Structure array
        %     function_handle -- Function Handle
        %     <classname>     -- Any MATLAB, Java or .NET class
        %  
        %   ISA(obj,'classCategory') returns true if obj is an instance of
        %   any of the classes in the specified classCategory, and false otherwise.
        %   isa also returns true if obj is an instance of a class that is derived 
        %   from any of the classes in classCategory.
        %  
        %   classCategory can be 'numeric', 'float', or 'integer', representing
        %   a category of classes:
        %   numeric -- Integer or floating-point array (double, single,
        %              int8, uint8, int16, uint16, int32, uint32,
        %              int64, uint64)
        %   float   -- Single- or double-precision floating-point array
        %              (double, single)
        %   integer -- Signed or unsigned integer array (int8, uint8,
        %              int16, uint16, int32, uint32, int64, uint64)
        end

        function obj = isCellStr(obj)
        % falcon.util.Assert/isCellStr is a function.
        %   obj = isCellStr(obj)
        end

        function obj = isCell(obj)
        % falcon.util.Assert/isCell is a function.
        %   obj = isCell(obj)
        end

        function obj = isMember(obj, of)
        % falcon.util.Assert/isMember is a function.
        %   obj = isMember(obj, of)
        end

        function obj = isVarname(obj)
        % falcon.util.Assert/isVarname is a function.
        %   obj = isVarname(obj)
        end

        function obj = isChar(obj)
        % falcon.util.Assert/isChar is a function.
        %   obj = isChar(obj)
        end

        function obj = isIndex(obj)
        % An index array must consist of positive natural numbers, but may be empty.
        end

        function obj = isWhole(obj)
        % An index array must consist of positive natural numbers, but may be empty.
        end

        function obj = isNotNan(obj)
        % falcon.util.Assert/isNotNan is a function.
        %   obj = isNotNan(obj)
        end

        function obj = isNotInf(obj)
        % falcon.util.Assert/isNotInf is a function.
        %   obj = isNotInf(obj)
        end

        function obj = isZero(obj)
        % falcon.util.Assert/isZero is a function.
        %   obj = isZero(obj)
        end

        function obj = isNotNegative(obj)
        % falcon.util.Assert/isNotNegative is a function.
        %   obj = isNotNegative(obj)
        end

        function obj = isNotPositive(obj)
        % falcon.util.Assert/isNotPositive is a function.
        %   obj = isNotPositive(obj)
        end

        function obj = isNegative(obj)
        % falcon.util.Assert/isNegative is a function.
        %   obj = isNegative(obj)
        end

        function obj = isPositive(obj)
        % falcon.util.Assert/isPositive is a function.
        %   obj = isPositive(obj)
        end

        function obj = isGreaterThanOrEqual(obj, comparator, name)
        % falcon.util.Assert/isGreaterThanOrEqual is a function.
        %   obj = isGreaterThanOrEqual(obj, comparator, name)
        end

        function obj = isLessThanOrEqual(obj, comparator, name)
        % falcon.util.Assert/isLessThanOrEqual is a function.
        %   obj = isLessThanOrEqual(obj, comparator, name)
        end

        function obj = isGreaterThan(obj, comparator, name)
        % falcon.util.Assert/isGreaterThan is a function.
        %   obj = isGreaterThan(obj, comparator, name)
        end

        function obj = isLessThan(obj, comparator, name)
        % falcon.util.Assert/isLessThan is a function.
        %   obj = isLessThan(obj, comparator, name)
        end

        function obj = isReal(obj)
        % falcon.util.Assert/isReal is a function.
        %   obj = isReal(obj)
        end

        function obj = isNumeric(obj)
        % falcon.util.Assert/isNumeric is a function.
        %   obj = isNumeric(obj)
        end

        function obj = hasColCount(obj, count)
        % falcon.util.Assert/hasColCount is a function.
        %   obj = hasColCount(obj, count)
        end

        function obj = isCol(obj)
        % falcon.util.Assert/isCol is a function.
        %   obj = isCol(obj)
        end

        function obj = hasRowCount(obj, count)
        % falcon.util.Assert/hasRowCount is a function.
        %   obj = hasRowCount(obj, count)
        end

        function obj = isRow(obj)
        % falcon.util.Assert/isRow is a function.
        %   obj = isRow(obj)
        end

        function obj = hasMinNumel(obj, num)
        % falcon.util.Assert/hasMinNumel is a function.
        %   obj = hasMinNumel(obj, num)
        end

        function obj = hasNumel(obj, num)
        % falcon.util.Assert/hasNumel is a function.
        %   obj = hasNumel(obj, num)
        end

        function obj = isNotScalar(obj)
        % falcon.util.Assert/isNotScalar is a function.
        %   obj = isNotScalar(obj)
        end

        function obj = is2DMatrix(obj)
        % falcon.util.Assert/is2DMatrix is a function.
        %   obj = is2DMatrix(obj)
        end

        function obj = isVector(obj)
        % falcon.util.Assert/isVector is a function.
        %   obj = isVector(obj)
        end

        function obj = isScalar(obj)
        % falcon.util.Assert/isScalar is a function.
        %   obj = isScalar(obj)
        end

        function obj = isNotEmpty(obj)
        % falcon.util.Assert/isNotEmpty is a function.
        %   obj = isNotEmpty(obj)
        end

        function notYetImplemented()
        % falcon.util.Assert.notYetImplemented is a function.
        end

    end

end