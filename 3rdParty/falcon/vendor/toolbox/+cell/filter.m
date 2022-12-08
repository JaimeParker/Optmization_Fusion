function filtered = filter(functionHandle, cellArray)
% Filters out cell where the function evaluates to false.
%
% <Usage>
% array = {'A', 'B', '', 'C', '', 'D'}
% filtered = cell.filter(@(string) ~isempty(string), array);
filtered = cellArray(cellfun(functionHandle, cellArray));
end

