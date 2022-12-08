classdef Intent
    %INTENT Holds intention needed to open a window.
    %
    % INTENT properties:
    %   WindowType       -  Class name of the window subclass to open. The
    %                       string part 'converter.gui.' may be omitted. E.g.
    %                       'clip.EditorWindow' opens a
    %                       converter.gui.clip.EditorWindow.
    %   Arguments        -  Custom configuration simply passed to the window.
    %   Data             -  Data handle a window operates on.
    %   ResultCallback   -  Callback with a single parameter to accept data
    %                       returned from the opened window.
    %
    % See also converter.gui.Context, converter.model.data.Data
    
    properties
        WindowType; % 1xn char
        Arguments; % 1x1 struct
        Data; % 1x1 converter.model.data.Data
        ResultCallback; % 1x1 function_handle
    end
    
    methods
        function self = Intent(windowType, arguments, data)
            self.WindowType = windowType;
            self.Arguments = arguments;
            self.Data = data;
            self.ResultCallback = @(~) [];
        end
    end
end

