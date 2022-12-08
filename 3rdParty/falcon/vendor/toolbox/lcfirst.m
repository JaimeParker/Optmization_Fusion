function str = lcfirst(str)
%LCFIRST Converts the first character to lower case
if ~isempty(str)
    str = [lower(str(1)), str(2:end)];
end
end
