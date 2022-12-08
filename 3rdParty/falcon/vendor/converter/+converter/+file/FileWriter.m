classdef FileWriter < handle
    %FILEWRITER Writes to a file identified by fileName.
    
    properties (Access = protected)
        FileUtil; % 1x1 converter.file.FileUtil
        FileName; % 1xn char
        StringWriter; % 1x1 converter.file.StringWriter
    end
    
    methods
        function self = FileWriter(fileUtil, fileName, stringWriter)
            self.FileUtil = fileUtil;
            self.FileName = fileName;
            self.StringWriter = stringWriter;
        end
        
        function write(self, value)
            content = self.StringWriter.write(value);
            self.FileUtil.write(self.FileName, content);
        end
    end
end

