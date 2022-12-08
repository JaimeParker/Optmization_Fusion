function varargout = ident(varargin)
% This is an identity function, the outputs equal the inputs.
%
% ident(x) === x
% max(x, y) === max(ident(x, y))
%
% <Usage>
% [a, b, c, ...] = ident(a, b, c, ...)
varargout = varargin;
end