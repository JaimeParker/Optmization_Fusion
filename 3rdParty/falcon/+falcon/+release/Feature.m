classdef Feature
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
        % Unique feature name
        Name
        % Features required for this feature to work
        Dependencies
        % Does this feature require a special license?
        License
        % Code sections exclusive to this feature
        Tags
        % Code files/directories to copy directly
        CopyPaths
        % Code files/directories to pcode()
        PreprocPaths
        % Examples to include
        Examples
        % Precompiled static documentation to include
        DocPaths
    end

    methods
        function self = Feature(varargin)
        % arguments
        %    attributes.?falcon.release.Feature
        %  end
        end

    end

end