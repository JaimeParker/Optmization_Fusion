function charValue = list2str(~, cellstr, forceBraces)
%LIST2STR - Joins a cellstr to be read with str2list.
%
% charValue = stringUtil.list2str(cellstr, forceBraces)
%
% LIST2STR parameters:
%   cellstr      -  Cell array to be collapsed by joining with comma.
%   forceBraces  -  Always wrap the result in curly braces {...}.
%
% LIST2STR examples:
%   {'A', 'B'}  ->  'A,B'   (with forceBraces option: '{A,B}')
%   {''}        ->  '{''}'  (same as with forceBraces option)
%   {}          ->  ''      (with forceBraces option: '{}')
%
% See also converter.util.StringUtil/str2list

if isequal(cellstr, {''})
    charValue = '{''''}';
else
    charValue = strjoin(cellstr, ',');
    
    if forceBraces
        charValue = ['{', charValue, '}'];
    end
end
end

