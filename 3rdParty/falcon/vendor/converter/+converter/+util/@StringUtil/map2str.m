function charValue = map2str(~, scalarStructWithStringFields)
%MAP2STR - Collapses a struct map into comma and colon markup.
%
% charValue = stringUtil.map2str(scalarStructWithStringFields)
%
% MAP2STR examples:
%   map = struct()        ->  ''
%   map.Name1 = 'Value1'  ->  'Name1:Value1'
%   map.Name2 = 'Value2'  ->  'Name1:Value1,Name2:Value2'
%
% See also converter.util.StringUtil/str2map

fieldNames = fieldnames(scalarStructWithStringFields);
nFields = length(fieldNames);
colonMaps = cell(1, nFields);

for iField = 1:nFields
    fieldName = fieldNames{iField};
    fieldValue = scalarStructWithStringFields.(fieldName);
    colonMaps{iField} = [fieldName, ':', fieldValue];
end

charValue = strjoin(colonMaps, ',');
end