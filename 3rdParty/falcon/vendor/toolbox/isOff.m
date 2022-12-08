function bool = isOff(string)
% True, if string is 'off', else false (case insensitive).
%
% <Usage>
% false = isOff('on')
% true = isOff('off')
bool = strcmpi(string, 'off');
end