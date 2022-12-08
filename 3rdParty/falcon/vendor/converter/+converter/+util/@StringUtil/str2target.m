function targetValue = str2target(self, charValue, targetType)
%STR2TARGET - Converts the given char value to the given targetType.
%
% targetValue = stringUtil.str2target(charValue, targetType)
%
% The targetType may be one of the following: 'char', 'cell', 'struct',
% 'logical', 'double', '' or an exist()ing class name.
%
% See also converter.util.StringUtil/str2list,
%          converter.util.StringUtil/str2map,
%          converter.util.StringUtil/str2log,
%          converter.util.StringUtil/str2num, feval

switch targetType
    case 'char'
        targetValue = charValue;
    case 'cell'
        targetValue = self.str2list(charValue);
    case 'struct'
        targetValue = self.str2map(charValue);
    case 'logical'
        targetValue = self.str2log(charValue);
    case 'double'
        targetValue = self.str2num(charValue, false);
    case ''
        if ~isempty(charValue) && charValue(1) == '{' && charValue(end) == '}'
            targetValue = self.str2list(charValue(2:end-1));
        else
            targetValue = self.str2num(charValue, true);
        end
    otherwise
        if exist(targetType, 'class')
            targetValue = self.ObjectProvider.get(charValue, targetType);
        else
            targetValue = feval(targetType, charValue);
        end
end
end

