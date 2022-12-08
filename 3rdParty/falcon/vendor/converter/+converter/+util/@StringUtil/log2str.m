function charValue = log2str(~, scalarLogical)
%LOG2STR - Converts the given logical into a human readable char.
%
% charValue = stringUtil.log2str(scalarLogical)
%
% LOG2STR examples:
%   true   ->  'yes'
%   false  ->  'no'
%
% See also converter.util.StringUtil/str2log

if scalarLogical
    charValue = 'yes';
else
    charValue = 'no';
end
end

