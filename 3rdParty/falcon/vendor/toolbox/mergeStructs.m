function struct1 = mergeStructs(struct1, struct2, varargin)
% Merges struct2 into struct1 by copying values.
%
% <Usage>
% struct = mergeStructs(struct1, struct2)
% struct = mergeStructs(struct1, struct2, 'AvoidEmptyFields', true)
%
% <NameValue>
% AvoidEmptyFields - do not merge empty fields into struct1, defaults
%                    false
parser = inputParser();
parser.FunctionName = 'mergeStructs';
parser.addParameter('AvoidEmptyFields', true, @islogical);
parser.parse(varargin{:});

for pair = eachField(struct2)
    [field, value] = pair{:};
    
    if ~parser.Results.AvoidEmptyFields || ~isempty(value)
        struct1.(field) = value;
    end
end
end

