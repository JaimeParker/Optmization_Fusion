function logicalValue = str2log(~, charValue)
%STR2LOG - Converts 'true', 'on', 'yes', '1' to true, opposites to false.
%
% logicalValue = stringUtil.str2log(charValue)
%
% STR2LOG examples:
%   'true',   'on', 'yes', '1'  ->  true
%   'false', 'off',  'no', '0'  ->  false
%   'any other value'           ->  error()

charValue = lower(charValue);
if isempty(charValue)
    logicalValue = logical.empty();
elseif any(strcmp(charValue, {'true', 'on', 'yes', '1'}))
    logicalValue = true;
elseif any(strcmp(charValue, {'false', 'off', 'no', '0'}))
    logicalValue = false;
else
    error('conv:str2log:CharIsNoLogical', ...
        'The given string ''%s'' is no logical.', charValue);
end
end

