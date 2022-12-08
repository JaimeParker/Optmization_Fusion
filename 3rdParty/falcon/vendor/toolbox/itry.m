function varargout = itry(tryHandle, catchHandle, varargin)
% Inline try catch.
%
% <Usage>
% result = itry(tryFcn, catchFcn)
% result = itry(tryFcn, catchFcn, parameters...)
try
    [varargout{1:nargout}] = tryHandle(varargin{:});
catch
    [varargout{1:nargout}] = catchHandle(varargin{:});
end
end