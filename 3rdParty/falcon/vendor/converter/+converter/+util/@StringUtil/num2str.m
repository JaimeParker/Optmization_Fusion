function charValue = num2str(~, numericMatrix)
%NUM2STR - Formats a numerical matrix, using colon syntax where possible.
%
% charValue = stringUtil.num2str(numericMatrix)
%
% NUM2STR examples:
%   []                 ->  ''
%   42.123             ->  '42.123'
%   [1,2]              ->  '1,2'
%   [1,2;3,4]          ->  '1,2;3,4'
%   [1 2 3 4]          ->  '1:4'
%   [1 2 3 4;5 6 7 8]  ->  '1:4;5:8'
%   [1 2 3 5 7 9 NaN]  ->  '1:3,5:2:9,NaN'
%
% See also converter.util.StringUtil/str2num

nRows = size(numericMatrix, 1);
formattedRows = cell(1, nRows);
for iRow = 1:nRows
    formattedRows{iRow} = formatRow(numericMatrix(iRow, :));
end
charValue = strjoin(formattedRows, ';');
end

function formatted = formatRow(numericRow)
formatted = {};
first = []; step = []; last = [];

for current = numericRow
    if isnan(current)
        if ~isempty(first)
            formatted{end + 1} = formatElement(first, step, last);
        end
        formatted{end + 1} = 'NaN'; %#ok<*AGROW>
        first = []; step = []; last = [];
    elseif isempty(first)
        first = current; step = []; last = current;
    elseif current == last
        formatted{end + 1} = formatElement(first, step, last);
        first = current; step = []; last = current;
    elseif ~isempty(step) && current - last ~= step
        formatted{end + 1} = formatElement(first, step, last);
        first = current; step = []; last = current;
    else
        step = current - last;
        last = current;
    end
end

if ~isempty(first)
    formatted{end + 1} = formatElement(first, step, last);
end

formatted = strjoin(formatted, ',');
end

function formatted = formatElement(first, step, last)
if first == last
    formatted = num2str(first);
elseif isempty(step) || (first + step) == last
    formatted = [num2str(first) ',' num2str(last)];
else
    if step == 1
        formatted = sprintf('%g:%g', first, last);
    else
        formatted = sprintf('%g:%g:%g', first, step, last);
    end
end
end
