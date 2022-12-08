classdef (Abstract) StringReader < handle
    %STRINGWRITER Deserializes a value from a string.
    
    methods (Abstract)
        value = read(self, string)
    end
end

