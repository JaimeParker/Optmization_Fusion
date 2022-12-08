classdef (Abstract) Window < handle & matlab.mixin.Heterogeneous
    %WINDOW Manages a figure window lifecycle.
    %
    % The WINDOW is the event-driven base class for GUI windows. To implement a
    % custom WINDOW, the protected event callbacks need to be overridden.
    %
    % WINDOW properties:
    %   Figure   -  The figure_handle drawn on screen.
    %   Intent   -  The intention that was used to open this WINDOW. May contain
    %               a Data handle or configuration Arguments.
    %   Context  -  The context for any subwindows created by this WINDOW.
    %
    % WINDOW protected events:
    %   onCreate           -  Called when the UI needs to be created. This
    %                         includes the figure handle and possible
    %                         uicontrols. As first parameter, it receives a
    %                         struct from a previous call to onSaveWindowState.
    %   onShow             -  Called when the WINDOW is to be shown on screen.
    %   onHide             -  Called when the WINDOW vanishes from screen.
    %                         Should stop custom animations or UI updates.
    %   onSizeChanged      -  Called when the figure is resized. Should layout
    %                         uicontrol positions.
    %   onSaveWindowState  -  Called when the WINDOW needs to save its layout or
    %                         model state. Return a struct as saved state. The
    %                         value is passed to onCreate when the same
    %                         WINDOW is opened again.
    %   onClose            -  Called when the close button of a window is
    %                         clicked. If not overridden, it closes subwindows
    %                         opened by this WINDOW automatically.
    %   onDelete           -  Called when the WINDOW is deallocated. Delete()
    %                         handles here to free up memory.
    %
    % WINDOW protected methods:
    %   returnResult  -  Returns arbitrary data to Intent.ResultCallback.
    %
    % WINDOW public methods:
    %   show             -  Shows the WINDOW on screen. On first call, both
    %                       onCreate and onShow are called
    %   hide             -  Hides the WINDOW from screen. The figure still
    %                       persists.
    %   close            -  Requests to close the figure. Can be blocked by
    %                       onClose event though.
    %   dock             -  Docks the figure into the MATLAB UI.
    %   undock           -  Undocks the figure from the MATLAB UI.
    %   waitUntilClosed  -  Blocks the current thread with uiwait until the
    %                       WINDOW is closed.
    %
    % See also converter.gui.Context, converter.gui.Intent, figure, uiwait
    
    properties (SetAccess = protected)
        Context; % 1x1 converter.gui.Context
        Intent; % 1x1 converter.gui.Intent
        Figure; % 1x1 figure handle
    end
    
    methods
        function self = Window(context, intent)
            self.Context = context;
            self.Intent = intent;
        end
        
        function show(self)
            %SHOW - Displays the figure on screen.
            if isempty(self.Figure) || ~isvalid(self.Figure)
                self.onCreate(self.Context.loadWindowState(self.Intent));
            else
                figure(self.Figure);
            end
            self.onShow();
        end
        
        function hide(self)
            %HIDE - Hides the figure from screen
            self.onHide();
        end
        
        function dock(self)
            %DOCK - Docks the figure into the MATLAB UI.
            self.Figure.WindowStyle = 'docked';
        end
        
        function undock(self)
            %UNDOCK - Undocks the figure from the MATLAB UI.
            self.Figure.WindowStyle = 'normal';
        end
        
        function waitUntilClosed(self)
            %WAITUNTILCLOSED - Blocks until the window is closed.
            try
                uiwait(self.Figure);
            catch exception
                self.close();
                rethrow(exception);
            end
        end
        
        function close(self)
            %CLOSE - Closes the figure and deleted this window.
            if isvalid(self) && ~isempty(self.Figure) && isvalid(self.Figure)
                self.hide();
            end
            self.onClose();
        end
        
        function delete(self)
            %DELETE - Deletes this window, closing the figure.
            if isa(self.Figure, 'matlab.ui.Figure') && isvalid(self.Figure)
                windowState = self.onSaveWindowState();
                self.Context.saveWindowState(self.Intent, windowState);
                self.onDelete();
            end
        end
    end
    
    methods (Access = protected)
        function onCreate(self, savedWindowState)
            %ONCREATE - event fired when object is created, setup UI here
            self.Figure = figure('Visible', 'off');
            self.Figure.NumberTitle = 'off';
            self.Figure.MenuBar = 'none';
            self.Figure.SizeChangedFcn = @(~, ~) self.onSizeChanged();
            self.Figure.CloseRequestFcn = @(~, ~) self.close();
            
            if ~isempty(savedWindowState)
                self.Figure.Position = savedWindowState.Position;
            end
        end
        
        function onSizeChanged(~)
            %ONSIZECHANGED - event fired if size changes
        end
        
        function onShow(self)
            %ONSHOW - event fired after window becomes active on screen
            self.Figure.Visible = 'on';
        end
        
        function onHide(self)
            %ONHIDE - event fired before window vanishes from screen
            self.Figure.Visible = 'off';
        end
        
        function windowState = onSaveWindowState(self)
            %ONSAVEWINDOWSTATE - event fired to persist window state
            windowState.Position = self.Figure.Position;
        end
        
        function onClose(self)
            %ONCLOSE - event fired right before window closes
            if isvalid(self)
                self.Context.closeAllWindows();
                delete(self);
            end
        end
        
        function onDelete(self)
            %ONDELETE - event fired before object is deleted
            delete(self.Figure);
        end
        
        function returnResult(self, result)
            %RETURNRESULT - Pass data back to Intent.ResultCallback.
            %
            % self.returnResult(value)
            self.Intent.ResultCallback(result);
        end
    end
end

