function str = camelCaseLarge(varargin)

if nargin == 1 && ischar(varargin{1})
    if any(varargin{1} == ' ')
        parts = strsplit(varargin{1});
    else
        parts = varargin;
    end
else
    parts = varargin;
end

str = cellfun(@ucfirst, parts, 'Uniform', false);
str = [str{:}];

end