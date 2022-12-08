function out = eachField(S)
% Iterates over all fields and values of a struct.
%
% <Usage>
% for field = eachField(myStruct)
%     [name, value] = field{:};
%     ...
% end
%
% See also each.iterators.TupleIterator
out = each.iterators.TupleIterator(fieldnames(S), struct2cell(S));
end