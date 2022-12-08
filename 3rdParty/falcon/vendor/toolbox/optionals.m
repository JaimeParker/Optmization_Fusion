function varargout = optionals(defaults, values)
% Define defaults and varargin, then this function provides optional
% values.
%
% <Usage>
% % varargin = {42}
% [a, b, c] = optionals({1, 2, 3}, varargin)
% % a == 42, b == 2, c == 3
%
% <Inputs>
% defaults - cell array of default values
% values - cell array of varargin, overwrites defaults
%
% <Outputs>
% varargout - directly assign optionals to different variables, see
%             example above
assert(iscell(defaults));
assert(iscell(values));

defaults(1:length(values)) = values;
varargout = defaults(1:nargout);
end

