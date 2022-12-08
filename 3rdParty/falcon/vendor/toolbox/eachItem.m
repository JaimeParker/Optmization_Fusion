function iterator = eachItem(list)
% Iterates over every item() in the java list.
%
% <Usage>
% for childNode = eachItem(node.getChildNodes())
%     ...
% end
%
% See also each.iterators.JavaItemListIterator
iterator = each.iterators.JavaItemListIterator(list);
end