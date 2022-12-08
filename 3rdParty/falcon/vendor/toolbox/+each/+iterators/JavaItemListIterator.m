classdef JavaItemListIterator < each.iterators.Iterable
    % Java list iterator, can be used to iterate item() in for loops.
    %
    % <Usage>
    % for childNode = eachItem(node.getChildNodes())
    %     ...
    % end
    
    properties (Access = private)
        JavaList;
    end
    
    methods
        function self = JavaItemListIterator(list)
            self.JavaList = list;
            self.NumberOfIterations = list.getLength();
        end
        
        function value = getValue(self, index)
            value = self.JavaList.item(index - 1);
        end
    end
end