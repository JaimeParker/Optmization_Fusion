function structValue = str2map(self, charValue)
%STR2MAP - Parses comma and colon map char to a struct with char fields.
%
% structValue = stringUtil.str2map(charValue)
%
% STR2MAP examples:
%   'A:B,C:D'           ->  struct('A', 'B', 'C', 'D')
%   'A:[1,2],C:[5:10]'  ->  struct('A', '[1,2]', 'C', '[5:10]')
%
% See also converter.util.StringUtil/str2list, strtok, cell2struct

items = self.str2list(charValue);
nItems = length(items);

keys = cell(nItems, 1);
values = cell(nItems, 1);

for iItem = 1:nItems
    [key, rest] = strtok(items{iItem}, ':');
    keys{iItem} = key;
    values{iItem} = rest(2:end);
end

structValue = cell2struct(values, keys);
end

