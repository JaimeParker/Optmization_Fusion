classdef (Abstract) HasUncertain < falcon.core.Handle & falcon.core.HasProblem
    % The base class, where every object can be derived from that may be uncertain.

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
        % Whether this value is uncertain or not.
        isUncertain
        % Distribution Type
        DistType
        % Distribution Values
        DistVals
        % Gaussian Mixture Model Values
        GMMVals
        % The development specification of the Distribution
        DistDevelopment
        % Number of trials in discrete distribution
        noTrials
    end

    methods
        function setNoTrials(obj, noTrials)
        % Set the number of trials of this object.
        %  
        % <Syntax>
        % obj.setNoTrials(noTrials)
        %  
        % <Description>
        % The input must be a numeric integer value greater than zero
        % specifying the number of trials required for a discrete
        % distribution.
        %  
        % <Inputs>
        % > noTrials: Number of trials
        %  
        % <Keywords>
        % Distribution!Trials
        end

        function setDistDevelopment(obj, DistDevelopment)
        % Set the distribution development of this object.
        %  
        % <Syntax>
        % obj.setDistDevelopment(DistDevelopment)
        %  
        % <Description>
        % The input must be a function handle, which calls the distribution
        % development of the object (default: @fcnname)
        %  
        % <Inputs>
        % > DistDevelopment: Function handle with the distribution development.
        %  
        % <Keywords>
        % Distribution!Development
        end

        function setGMMVals(obj, DistVals)
        % Set the gaussian mixture model values of this object.
        %  
        % <Syntax>
        % obj.setGMMVals(DistVals)
        %  
        % <Description>
        % The input must be a [n,3] vector describing the parameters of
        % the parameter distribution, with n being the number of
        % gaussians in the gaussian mixture model for the 1D
        % distribution (default: [0,1,1])
        % Logic is: [mean,standard deviation,gmm weights]
        %  
        % <Inputs>
        % > DistVals: The values specifying the distribution.
        %  
        % <Keywords>
        % Distribution!GMM
        end

        function setDistVals(obj, DistVals)
        % Set the distribution values of this object.
        %  
        % <Syntax>
        % obj.setDistVals(DistVals)
        %  
        % <Description>
        % The input must be a [1,4] vector describing the parameters of
        % the parameter distribution
        % Logic is either:
        %                   - [mean,standard deviation,alpha,beta], or
        %                   - [lower bound,upper bound,alpha,beta]
        % depending on the chosen distribution (default: [0,1,0,0])
        %  
        % <Inputs>
        % >DistVals: The values specifying the distribution.
        %  
        % <Keywords>
        % Distribution!Values
        end

        function setDistType(obj, DistType)
        % Set the distribution type of this object.
        %  
        % <Syntax>
        % obj.setDistType(DistType)
        %  
        % <Description>
        % The input must be a char specifying the uncertainty
        % distribution for the parameter. (default: 'Gaussian')
        %  
        % <Inputs>
        % >DistType: Distribution Type for the uncertainty analysis.
        %  
        % <Keywords>
        % Distribution!Type
        end

        function setUncertain(obj, Uncertain)
        % Sets the isUncertain property of this object. Uncertain objects will
        % be handled by a distribution of the parameters in the robust optimal control.
        %  
        % <Syntax>
        % obj.setUncertain(Uncertain)
        %  
        % <Description>
        % Sets, if this object is uncertain or not. (default: true)
        %  
        % <Inputs>
        % > Uncertain: A scalar boolean specifying if the object is Uncertain or not. Uncertain objects will
        % be handled by a stochastic distribution of the parameters in the optimization.
        %  
        % <Keywords>
        % Flags!Uncertain
        end

        function obj = HasUncertain()
        % The base class, where every object can be derived from that may be uncertain.
        end

    end

end