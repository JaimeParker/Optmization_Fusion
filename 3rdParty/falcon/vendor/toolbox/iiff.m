function result = iiff(condition, thenPredicate, elsePredicate, varargin)
% Inline if-else with function evaluation.
%
% <Usage>
% result = iiff(condition, thenFunction, elseFunction)
% result = iiff(condition, thenFunction, elseFunction, parameters...)
%
% <Example>
% text = iiff(exist(fileName, 'file'), @fileread, @() 'default value', fileName);
if condition
    result = thenPredicate(varargin{:});
else
    result = elsePredicate(varargin{:});
end
end