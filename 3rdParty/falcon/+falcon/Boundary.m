classdef Boundary < logical
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
        function tau = getNormalizedTime(self)
        % falcon.Boundary/getNormalizedTime is a function.
        %   [tau] = getNormalizedTime(self)
        end

        function e = Boundary(varargin)
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

        function lhs1 = char(rhs1)
        % Char conversion for enumeration classes
        end

        function TF = eq(A, B)
        % ==  Equal.
        %   A == B does element by element comparisons between A and B and returns
        %   an array with elements set to logical 1 (TRUE) where the relation is
        %   true and elements set to logical 0 (FALSE) where it is not. A and B
        %   must have compatible sizes. In the simplest cases, they can be the same
        %   size or one can be a scalar. Two inputs have compatible sizes if, for
        %   every dimension, the dimension sizes of the inputs are either the same
        %   or one of them is 1.
        %  
        %   C = EQ(A,B) is called for the syntax 'A == B' when A or B is an object.
        end

        function TF = ne(A, B)
        % ~=  Not equal.
        %   A ~= B does element by element comparisons between A and B and returns
        %   an array with elements set to logical 1 (TRUE) where the relation is
        %   true and elements set to logical 0 (FALSE) where it is not. A and B
        %   must have compatible sizes. In the simplest cases, they can be the same
        %   size or one can be a scalar. Two inputs have compatible sizes if, for
        %   every dimension, the dimension sizes of the inputs are either the same
        %   or one of them is 1.
        %  
        %   C = NE(A,B) is called for the syntax 'A ~= B' when A or B is an object.
        end

        function lhs1 = cellstr(rhs1)
        % Cellstr conversion for enumeration classes
        end

        function lhs1 = string(rhs1)
        % string conversion for enumeration classes
        end

        function lhs1 = strcmp(rhs1, rhs2)
        % strcmp for enumeration classes
        end

        function lhs1 = strncmp(rhs1, rhs2, rhs3)
        % strncmp for enumeration classes
        end

        function lhs1 = strcmpi(rhs1, rhs2)
        % strcmpi for enumeration classes
        end

        function lhs1 = strncmpi(rhs1, rhs2, rhs3)
        % strncmpi for enumeration classes
        end

        function varargout = setdiff(varargin)
        % setdiff for enumeration classes
        end

        function varargout = setxor(varargin)
        % setxor for enumeration classes
        end

        function varargout = union(varargin)
        % union for enumeration classes
        end

        function varargout = intersect(varargin)
        % intersect for enumeration classes
        end

        function varargout = ismember(varargin)
        % ismember for enumeration classes
        end

        function lhs1 = isequal(rhs1)
        % isequal for enumerations, including support for string/char vector/cellstr comparisons
        end

        function lhs1 = isequaln(rhs1)
        % isequaln for enumerations, including support for string/char vector/cellstr comparisons
        end

        function lhs1 = isequalwithequalnans(rhs1)
        % isequalwithequalnans for enumerations, including support for string/char vector/cellstr comparisons
        end

    end

end