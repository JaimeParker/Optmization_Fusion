classdef Cache < falcon.core.Handle
    % -------------------------------------------------------------------------
    %                                FALCON.m
    % Copyright (c) 2014-2019 Institute of Flight System Dynamics, TUM, Munich
    % Matthias Bittner, Matthias Rieck, Maximilian Richter,
    % Benedikt Grueter, Johannes Diepolder, Florian Schwaiger,
    % Patrick Piprek, and Florian Holzapfel
    % Downloading, using, copying, or modifying FALCON.m code constitutes an
    % agreement to ALL of the terms of the FALCON.m EULA.
    % -------------------------------------------------------------------------

    % -------------------------------------------------------------------------
    %                                FALCON.m
    % Copyright (c) 2014-2019 Institute of Flight System Dynamics, TUM, Munich
    % Matthias Bittner, Matthias Rieck, Maximilian Richter,
    % Benedikt Grueter, Johannes Diepolder, Florian Schwaiger,
    % Patrick Piprek, and Florian Holzapfel
    % Downloading, using, copying, or modifying FALCON.m code constitutes an
    % agreement to ALL of the terms of the FALCON.m EULA.
    % -------------------------------------------------------------------------

    properties
    end

    methods
        function path = getAttributeFile(self, id, name)
        % falcon.core.builder.Cache/getAttributeFile is a function.
        %   [path] = getAttributeFile(self, id, name)
        end

        function self = save(self, entry)
        % SAVE Save workspace variables to file. 
        %   SAVE(FILENAME) stores all variables from the current workspace in a
        %   MATLAB formatted binary file (MAT-file) called FILENAME. Specify 
        %   FILENAME as a character vector or a string scalar. For example, specify
        %   FILENAME as 'myFile.mat' or "myFile.mat".
        %  
        %   SAVE(FILENAME,VARIABLES) stores only the specified variables. Specify 
        %   FILENAME and VARIABLES as character vectors or string scalars.
        %  
        %   SAVE(FILENAME,'-struct',STRUCTNAME,FIELDNAMES) stores the fields of the
        %   specified scalar structure as individual variables in the file. If you 
        %   include the optional FIELDNAMES, the SAVE function stores only the
        %   specified fields of the structure.  You cannot specify VARIABLES and 
        %   the '-struct' keyword in the same call to SAVE.
        %  
        %   SAVE(FILENAME, ..., '-append') adds new variables to an existing file.
        %   You can specify '-append' with additional inputs such as VARIABLES,
        %   '-struct', FORMAT, or VERSION.
        %  
        %   SAVE(FILENAME, ..., FORMAT) saves in the specified format: '-mat' or
        %   '-ascii'.
        %   You can specify FORMAT with additional inputs such as VARIABLES,
        %   '-struct', '-append', or VERSION.
        %  
        %   SAVE(FILENAME, ..., VERSION) saves to MAT-files in the specified
        %   version: '-v4', '-v6', '-v7', or '-v7.3'.
        %   You can specify VERSION with additional inputs such as VARIABLES,
        %   '-struct', '-append', '-nocompression', or FORMAT.
        %  
        %   SAVE(FILENAME, ..., '-nocompression', '-v7.3') saves to MAT-files version 7.3
        %   without compression.
        %   You can specify '-nocompression' with additional inputs such as VARIABLES and
        %   '-append'. This option is supported for MAT-files version 7 and above.
        %  
        %   SAVE FILENAME ... is the command form of the syntax, for convenient 
        %   saving from the command line.  With command syntax, you do not need to
        %   enclose FILENAME in single or double quotation marks.  Separate inputs 
        %   with spaces instead of commas.  Do not use command syntax if inputs 
        %   such as FILENAME are variables.
        %  
        %   Inputs:
        %  
        %   FILENAME: If you do not specify FILENAME, the SAVE function saves to a
        %   file named matlab.mat.  If FILENAME does not include an extension and 
        %   the value of format is '-mat' (the default), MATLAB appends .mat. If 
        %   filename does not include a full path, MATLAB saves in the current
        %   folder. You must have permission to write to the file.
        %  
        %   VARIABLES:  Save only selected variables from the workspace.
        %   Use one of the following forms:
        %  
        %       V1, V2, ...              Save the listed variables. Use the '*'
        %                                wildcard to match patterns.  For example,
        %                                save('A*') saves all variables that start
        %                                with A.
        %       '-regexp', EXPRESSIONS   Save only the variables that match the
        %                                specified regular expressions. SAVE treats
        %                                all inputs as regular expressions except
        %                                the optional FILENAME and STRUCTNAME.  The
        %                                FILENAME input must appear first.  For
        %                                more information on regular expressions,
        %                                type "doc regexp" at the command prompt.
        %  
        %   '-struct', STRUCTNAME, FIELDNAMES:  Save the fields of a scalar
        %   structure as individual variables in the file.  FIELDNAMES is optional; 
        %   specify to save only selected fields.  FIELDNAMES use the same forms as
        %   VARIABLES.
        %  
        %   '-append': Add data to an existing file.  For MAT-files, '-append' adds
        %   new variables to the file or replaces the saved values of existing
        %   variables with values in the workspace.  For ASCII files, '-append'
        %   adds data to the end of the file.
        %  
        %   FORMAT: Specify the format of the file, regardless of any specified
        %   extension.  Use one of the following combinations:
        %  
        %       '-mat'                        Binary MAT-file format (default).
        %       '-ascii'                      8-digit ASCII format.
        %       '-ascii', '-tabs'             Tab-delimited 8-digit ASCII format.
        %       '-ascii', '-double'           16-digit ASCII format.
        %       '-ascii', '-double', '-tabs'  Tab-delimited 16-digit ASCII format.
        %  
        %       For ASCII file formats, the SAVE function has the following
        %       limitations:
        %       * Each variable must be a two-dimensional double or char array.
        %       * MATLAB translates characters to their corresponding internal
        %         ASCII codes.  For example, 'abc' appears in an ASCII file as:
        %             9.7000000e+001  9.8000000e+001  9.9000000e+001
        %       * The output includes only the real component of complex numbers.
        %       * If you plan to use the LOAD function to read the file, all
        %         variables must have the same number of columns.
        %  
        %   '-nocompression': Save data to a MAT-file without compression. The
        %   '-nocompression' option is only supported for MAT-files version 7 and above.
        %  
        %   VERSION: Create a MAT-file that you can load into an earlier version of
        %   MATLAB or that supports specific features.  The following table shows 
        %   the available MAT-file version options and the corresponding supported
        %   features.
        %  
        %            | Can Load in  |
        %   Option   | Versions     | Supported Features
        %   ---------+--------------+----------------------------------------------
        %   '-v7.3'  | 7.3 or later | Version 7.0 features plus support for
        %            |              | data items greater than or equal to 2GB on
        %            |              | 64-bit systems.
        %   ---------+--------------+----------------------------------------------
        %   '-v7'    | 7.0 or later | Version 6 features plus data compression and
        %            |              | Unicode character encoding. Saving variables
        %            |              | without compression is also supported using 
        %            |              | the '-nocompression' flag.
        %   ---------+--------------+----------------------------------------------
        %   '-v6'    | 5 or later   | Version 4 features plus N-dimensional arrays,
        %            |              | cell and structure arrays, and variable names
        %            |              | greater than 19 characters
        %   ---------+--------------+----------------------------------------------
        %   '-v4'    | all          | Two-dimensional double, character, and
        %            |              | sparse arrays
        %  
        %   If any data items require features that the specified version does not
        %   support, MATLAB does not save those items and issues a warning. You 
        %   cannot specify a version later than your version of MATLAB software.
        %  
        %   To view or set the default version for MAT-files, select
        %   File > Preferences > General > MAT-Files.
        %  
        %   Examples:
        %  
        %   % Save all variables from the workspace to test.mat:
        %   save test.mat
        %  
        %   % Save two variables, where FILENAME is a variable:
        %   savefile = 'pqfile.mat';
        %   p = rand(1, 10);
        %   q = ones(10);
        %   save(savefile, 'p', 'q');
        %  
        %   % Save the fields of a structure as individual variables:
        %   s1.a = 12.7;
        %   s1.b = {'abc', [4 5; 6 7]};
        %   s1.c = 'Hello!';
        %   save('newstruct.mat', '-struct', 's1');
        %  
        %   % Save variables whose names contain digits:
        %   save myfile.mat -regexp \d
        end

        function entry = get(self, id)
        % GET    Get object properties.
        %   V = GET(H,'PropertyName') returns the value of the specified property
        %   for the graphics object with handle H.  If H is a vector of handles,
        %   then get will return an M-by-1 cell array of values where M is equal
        %   to length(H).  If 'PropertyName' is replaced by a 1-by-N or N-by-1 cell
        %   array of strings containing property names, then GET will return an 
        %   M-by-N cell array of values.
        %  
        %   GET(H) displays the names and current values of all user-gettable 
        %   properties for the graphics object with handle H.
        %  
        %   V = GET(H) where H is a scalar, returns a structure where each field
        %   name is the name of a user-gettable property of H and each field
        %   contains the value of that property.
        %  
        %   V = GET(0, 'Factory') 
        %   V = GET(0, 'Factory<ObjectType>')
        %   V = GET(0, 'Factory<ObjectType><PropertyName>') 
        %   returns for all object types the factory values of all properties
        %   which have user-settable default values.  
        %  
        %   V = GET(H, 'Default') 
        %   V = GET(H, 'Default<ObjectType>') 
        %   V = GET(H, 'Default<ObjectType><PropertyName>') 
        %   returns information about default property values (H must be scalar).  
        %   'Default' returns a list of all default property values currently set 
        %   on H.  'Default<ObjectType>' returns only the defaults for properties 
        %   of <ObjectType> set on H.
        %   'Default<ObjectType><PropertyName>' returns the default value for the
        %   specific property, by searching the defaults set on H and its
        %   ancestors, until that default is found.  If no default value for this
        %   property has been set on H or any ancestor of H up through the root, 
        %   then the factory value for that property is returned.
        %   Defaults can not be queried on a descendant of the object, or on the
        %   object itself - for example, a value for 'DefaultAxesColor' can not
        %   be queried on an axes or an axes child, but can be queried on a figure
        %   or on the root.
        %  
        %   When using the 'Factory' or 'Default' GET, if PropertyName is omitted 
        %   then the return value will take the form of a structure in which each 
        %   field name is a property name and the corresponding value is the value
        %   of that property.  If PropertyName is specified then a matrix or string
        %   value will be returned.
        end

        function flag = has(self, id)
        % falcon.core.builder.Cache/has is a function.
        %   [flag] = has(self, id)
        end

        function path = getRoot(self)
        % falcon.core.builder.Cache/getRoot is a function.
        %   [path] = getRoot(self)
        end

        function self = setRoot(self, path)
        % falcon.core.builder.Cache/setRoot is a function.
        %   [self] = setRoot(self, path)
        end

        function self = Cache(path)
        % Create a Cache object.
        %  
        % <Syntax>
        % cache = falcon.core.builder.Cache(path)
        %  
        % <Inputs>
        % > path: filesystem path of the cache directory (must exist)
        end

    end

end