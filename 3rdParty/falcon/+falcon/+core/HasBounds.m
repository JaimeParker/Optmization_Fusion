classdef HasBounds < falcon.core.HasProblem & falcon.core.Handle
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
        % Lower bound of the falcon.core.OVC value. It is initialized with
        % minus infinity. Scaling and Offset are applied to the
        % LowerBound as well.
        LowerBound
        % Upper bound of the falcon.core.OVC value. It is initialized with
        % plus infinity. Scaling and Offset are applied to the
        % UpperBound as well.
        UpperBound
    end

    methods
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

        function obj = HasBounds()
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