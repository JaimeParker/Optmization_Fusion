function str = ucfirst(str)
%UCFIRST Converts the first character to upper case
if ~isempty(str)
    str = [upper(str(1)), str(2:end)];
end
end
