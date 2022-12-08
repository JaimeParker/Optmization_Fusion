function init()
% loadJavaCustomizations - Load the custom java files for uiextras.jTree

%   Copyright 2012-2014 The MathWorks, Inc.
%
% Auth/Revision:
%   MathWorks Consulting
%   $Author: rjackey $
%   $Revision: 146 $  $Date: 2014-10-16 16:50:40 -0400 (Thu, 16 Oct 2014) $
%
% Auth/Revision:
%   Florian Schwaiger
%   Code formatting and cleanup
%   2016-02-25

jarFileName = 'UIExtrasTree.jar';
jarFilePath = fullfile(fileparts(mfilename('fullpath')), jarFileName);

javaInMemory = javaclasspath('-dynamic');
isPathLoaded = any(strcmp(javaInMemory, jarFilePath));

if ~isPathLoaded
    javaaddpath(jarFilePath);
end
