function bool = isOn(string)
% True, if string is 'on', else false (case insensitive).
%
% <Usage>
% false = isOff('off')
% true = isOff('on')
bool = strcmpi(string, 'on');
end