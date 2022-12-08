function str = camelCaseSmall(varargin)

str = lcfirst(camelCaseLarge(varargin{:}));

end