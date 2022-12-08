function numericValue = str2num(~, charValue, allowCharFallback)
%STR2NUM - Safely loads numericals, preventing eval() security risks.
%
% numericValue = stringUtil.str2num(charValue, allowCharFallback)
%
% The MATLAB builtin str2num method uses eval() internally and has no sanity
% checks on its input. That is, if the charValue is a valid class name, that
% class is evaluated, even though it's no numerical value.
%
% This derivative however does some brief sanity checks to avoid this
% security issue. Also the second parameter allows to either silently or
% explicitly fail on invalid conversion. If true, the output may still be
% the input charValue.
%
% See also str2num

success = false;

if ~exist(charValue, 'class')
    [numerical, isNumeric] =  str2num(charValue);
    if isNumeric
        numericValue = numerical;
        success = true;
    end
end

if ~success
    if allowCharFallback
        numericValue = charValue;
    else
        error('conv:str2num', '%s is no numeric expression', charValue);
    end
end
end

