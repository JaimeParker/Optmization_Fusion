function varargout = falcon(command, varargin)
% This is the falcon.m command line tool. Use it to setup your project
% and access convenience features.
%
% <Syntax>
% falcon command <arguments> [--parameters]
%
% <Keywords>
% falcon

% make sure all vendor paths are loaded (e.g. for the each() function)
falcon.init();

if nargin == 0
    
    % user called "falcon" without arguments, show which exist
    falcon('list')
    
elseif nargin > 0
    
    try
        % resolve the command handler (read +falcon/+console/Package.m)
        handler = Injector().with(command).get(?falcon.console.Command);
    catch
        error('falcon:InvalidInput', [ ...
            'Unknown command ''%s''. Check <a href="matlab:falcon list">'...
            'falcon list</a> if you misspelled it.'], command);
    end
    
    % execute the command
    [varargout{1:nargout}] = handler.run(varargin);
    
end
end