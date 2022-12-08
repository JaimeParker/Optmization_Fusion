function line = readline(~, fileName, lineNumber)
%READLINE - Reads the line identified by lineNumber from fileName.
%
% line = fileUtil.readline(fileName, lineNumber)
%
% See also fopen, fgetl, feof, fclose

line = '';
fileId = fopen(fileName, 'r');

currentLineNumber = 0;
while ~feof(fileId)
    currentLineNumber = currentLineNumber + 1;
    if currentLineNumber < lineNumber
        fgetl(fileId);
    else
        line = fgetl(fileId);
        break
    end
end

fclose(fileId);
end

