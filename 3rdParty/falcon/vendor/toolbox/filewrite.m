function filewrite(name, content, mode)
%FILEWRITE Writes contents to the given filename. Counterpart to readfile()
%
% Usage:
%   filewrite(filename, contents)
%   filewrite(filename, contents, 'a')
%
% See also: fileread
if nargin < 3
    mode = 'w+';
end

% if the parent folder does not exist, fopen would error
if ~exist(fileparts(name), 'dir')
    mkdir(fileparts(name));
end

fid = fopen(name, mode);
try
    fprintf(fid, '%s', content);
    fclose(fid);
catch exception
    fclose(fid);
    rethrow(exception);
end
end