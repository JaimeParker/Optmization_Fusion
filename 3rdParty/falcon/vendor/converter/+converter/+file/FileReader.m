classdef FileReader < handle
    %FILEREADER Reads a file identified by fileName.
    
    properties (Access = protected)
        FileName char; % 1xn char
        StringReader; % 1x1 converter.file.StringReader
    end
    
    methods
        function self = FileReader(fileName, stringReader)
            self.FileName = fileName;
            self.StringReader = stringReader;
        end
        
        function value = read(self)
            string = fileread(self.FileName);
            value = self.StringReader.read(string);
        end
    end
end

