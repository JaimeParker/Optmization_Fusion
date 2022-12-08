function write(~, name, content, mode)
%WRITE Writes contents to the given filename. Counterpart to readfile()
%
% Usage:
%   write(filename, contents)
%   write(filename, contents, 'a')
%
% See also: fileread
if nargin < 4
    mode = 'w+';
end

% we need this value three times below, assign it once
folder = fileparts(name);
% mkdir fails if either the folder is '' or the folder exists
if ~isempty(folder) && ~exist(folder, 'dir')
    % if the parent folder does not exist, fopen would error
    mkdir(folder);
end

% open the file (does not throw)
fid = fopen(name, mode);

try
    % write to the file (can throw)
    fprintf(fid, '%s', content);
    % release the resource (can throw)
    fclose(fid);
catch exception
    % if fprintf errored, force close the file
    fclose(fid);
    % we still want to debug the error
    rethrow(exception);
end
end