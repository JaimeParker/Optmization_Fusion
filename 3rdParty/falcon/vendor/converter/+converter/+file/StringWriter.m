classdef (Abstract) StringWriter < handle
    %STRINGWRITER Serializes a value to a string.
    
    methods (Abstract)
        string = write(self, value)
    end
end

