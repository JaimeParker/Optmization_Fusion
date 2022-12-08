function cellValue = str2list(~, charValue)
%STR2LIST - Splits a comma separated list into cell array of strings.
%
% cellValue = stringUtil.str2list(charValue)
%
% This method pays attention to parentheses. That is, commas within
% parentheses will not be used to split the cell array. That way you can
% split the following examplary lists correctly. Note that leading and
% trailing whitespace will be trimmed from all items.
%
% STR2LIST examples:
%   '' / '{}'                     ->  {}
%   '''' / '{''}'                 ->  {''}
%   '   A, B, C   '               ->  {'A', 'B', 'C'}
%   'A, zeros(1, size(A, 1)), C'  ->  {'A', 'zeros(1, size(A, 1))', 'C'}
%   'A, B(:,2), C'                ->  {'A', 'B(:,2)', 'C'}
%   'A, [B, D], C'                ->  {'A', '[B, D]', 'C'}

charValue = strtrim(charValue);

if ~isempty(charValue) && charValue(1) == '{' && charValue(end) == '}'
    charValue = charValue(2:end-1);
end

charValue = strtrim(charValue);

if strcmp(charValue, '''''')
    cellValue = {''};
    return
end

parenthesesLevel = [0 0 0];
currentPosition = 1;
lastPosition = 0;
cellValue = {};

for c = charValue
    switch c
        case '('
            parenthesesLevel(1) = parenthesesLevel(1) + 1;
        case '['
            parenthesesLevel(2) = parenthesesLevel(2) + 1;
        case '{'
            parenthesesLevel(3) = parenthesesLevel(3) + 1;
        case ')'
            parenthesesLevel(1) = parenthesesLevel(1) - 1;
        case ']'
            parenthesesLevel(2) = parenthesesLevel(2) - 1;
        case '}'
            parenthesesLevel(3) = parenthesesLevel(3) - 1;
        case ','
            if all(parenthesesLevel == 0)
                start = lastPosition + 1;
                stop = currentPosition - 1;
                lastPosition = currentPosition;
                cellValue{end + 1} = charValue(start:stop); %#ok<AGROW>
            end
    end
    currentPosition = currentPosition + 1;
end

lastStart = lastPosition + 1;
cellValue{end + 1} = charValue(lastStart:end);
cellValue = cellfun(@strtrim, cellValue, 'UniformOutput', false);

if isempty(cellValue) || (isscalar(cellValue) && isempty(cellValue{1}))
    cellValue = {};
end
end

