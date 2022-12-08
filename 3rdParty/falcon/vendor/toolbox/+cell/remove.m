function filtered = remove(functionHandle, cellArray)
% Removes elements from the array where function is true.
%
% <Usage>
% filtered = cell.remove(functionHandle, cellArray);
filtered = cellArray(~cellfun(functionHandle, cellArray));
end

