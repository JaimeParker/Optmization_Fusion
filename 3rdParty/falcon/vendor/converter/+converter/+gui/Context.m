classdef Context < handle
    %CONTEXT Windows and their saved states are accessed within this context.
    %
    % context = get(Injector, ?converter.gui.Context)
    %
    % When windows are opened, their saved state from their last time opened is
    % injected. The window states are saved within the MATLAB preference
    % database, accessed via setpref and getpref.
    %
    % CONTEXT methods:
    %   openWindow            -  Opens a window for the given Intent.
    %   closeWindow           -  Closes the window matching the given Intent.
    %   closeAllWindows       -  Closes all windows that were opened within this
    %                            CONTEXT.
    %   loadWindowState       -  Loads the window state for the given Intent.
    %   saveWindowState       -  Saves the window state for the given Intent.
    %   clearAllWindowStates  -  Clear all saved window states.
    %
    % See also converter.gui.Window, converter.gui.Intent, setpref, getpref
    
    
    properties (Access = private)
        WindowProvider; % provider<converter.gui.Window>
        HashProvider; % provider<1x32 char>
        Windows = struct(); % 1x1 struct
    end
    
    properties (Constant)
        GROUP = 'FsdConverterGui'; % 'FsdConverterGui'
        PREFIX = 'Window'; % 'Window'
    end
    
    methods
        function self = Context(windowProvider, hashProvider)
            self.WindowProvider = windowProvider;
            self.HashProvider = hashProvider;
        end
        
        function window = openWindow(self, intent)
            identifier = self.identifier(intent);
            
            try
                window = self.Windows.(identifier);
                window.show();
            catch
                window = self.WindowProvider.get(intent);
                self.Windows.(identifier) = window;
                window.show();
            end
        end
        
        function closeWindow(self, intent)
            identifier = self.identifier(intent);
            self.Windows.(identifier).close();
        end
        
        function closeAllWindows(self)
            structfun(@close, self.Windows);
        end
        
        function windowState = loadWindowState(self, intent)
            identifier = self.identifier(intent);
            windowState = getpref(self.GROUP, identifier, []);
        end
        
        function saveWindowState(self, intent, windowState)
            identifier = self.identifier(intent);
            setpref(self.GROUP, identifier, windowState);
        end
        
        function clearWindowStates(self)
            try %#ok<TRYNC>
                rmpref(self.GROUP);
            end
        end
    end
    
    methods (Access = private)
        function identifier = identifier(self, intent)
            hash = self.HashProvider.get({intent.WindowType, intent.Arguments});
            identifier = [self.PREFIX, hash];
        end
    end
end

