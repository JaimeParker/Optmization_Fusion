function mapped = map(functionHandle, cellArray)
% A slightly more intelligent cellfun(), avoids using 'UniformOutput'.
%
% After calling cellfun, tries to merge the cell array to a normal
% array. This works only if all mapped values are scalars.
%
% This function can also map graphics or listener handles, which is
% normally not possible with cellfun().
%
% <Usage>
% mapped = cell.map(functionHandle, cellArray)
%
% See also cellfun
mapped = cellfun(functionHandle, cellArray, 'UniformOutput', false);

if all(cellfun(@isscalar, mapped)) && ~iscellstr(mapped)
    try
        mapped = [mapped{:}];
    catch
        % fail silently
    end
end
end
