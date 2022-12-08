function result = iif(condition, thenResult, elseResult)
% Inline if-else with a priori evaluation.
%
% <Usage>
% result = iif(condition, thenValue, elseValue)
%
% <Example>
% % allow the user to pass a list of names as varargin or cellstr
% names = iif(iscell(varargin{1}), varargin{1}, varargin)
if condition
    result = thenResult;
else
    result = elseResult;
end
end