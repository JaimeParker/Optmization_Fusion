classdef (Abstract) SimpleListener < handle
    % Simplifies listening to property changes with many useful methods.
    %
    % This class is to be extended, adds simple methods to manage property
    % listeners easily. See all protected methods below. $n denotes a
    % placeholder for the n-th argument.
    %
    % <Methods>
    % onChangeCallback         - on change of $1.$2, call $3
    % onChangeOfAnyCallback    - on change of $1.*, call $2
    % endAllPropertyCallbacks  - remove all listeners
    % endPropertyCallbacksFrom - remove listeners by source object $1
    % endPropertyCallbacksWith - remove listeners by callback $1
    
    properties (Access = private)
        % 1xn event.listener
        Listeners = event.listener.empty()
    end
    
    methods
        function delete(self)
            % Cleans up all callbacks to avoid memory leaks.
            self.endAllPropertyCallbacks();
        end
    end
    
    methods (Access = protected)
        function self = onChangeCallback(self, objects, names, callback)
            % Executes the given callback if the specified properties on
            % the target handle(s) change.
            %
            % <Usage>
            % self.onChangeCallback(targetObject, ..., callback)
            % self.onChangeCallback(targetObjectArray, ..., callback)
            % self.onChangeCallback(targetObjectCellArray, ..., callback)
            % self.onChangeCallback(..., propertyName, callback)
            % self.onChangeCallback(..., propertyNameCellArray, callback)
            %
            % <Inputs>
            % objects - object handle(s) or cell array of handles which
            %           will be checked for updates
            % names - string or cell array of strings specifying observed
            %         property names
            % callback - function handle to execute when target properties
            %            change, must have (src, event) input arguments
            if iscell(objects)
                objects = [objects{:}];
            end
            
            properties = metaPropertiesByName(objects, names);
            assert(~isempty(properties));
            
            self.Listeners(end + 1) = event.proplistener( ...
                objects, properties, 'PostSet', callback);
        end
        
        function self = onChangeOfAnyCallback(self, objects, callback)
            % Executes the given callback if any properties on target
            % change.
            %
            % <Usage>
            % self.onChangeOfAnyCallback(targetObject, callback)
            % self.onChangeOfAnyCallback(targetObjectArray, callback)
            % self.onChangeOfAnyCallback(targetObjectCellArray, callback)
            %
            % <Inputs>
            % objects - object handle(s) or cell array of handles which
            %           will be checked for updates
            % callback - function handle to execute when target properties
            %            change, must have (src, event) input arguments
            if iscell(objects)
                names = properties(objects{1});
            else
                names = properties(objects(1));
            end
            
            self.onChangeCallback(self, objects, names, callback);
        end
        
        function self = endAllPropertyCallbacks(self)
            % Clears all callbacks registered from this class.
            %
            % <Usage>
            % self.endAllPropertyCallbacks()
            delete(self.Listeners);
            self.removeInvalidListeners();
        end
        
        function self = endPropertyCallbacksFrom(self, objects)
            % Clears all callbacks on the given target handle(s).
            %
            % <Usage>
            % self.endPropertyCallbacksFrom(object)
            % self.endPropertyCallbacksFrom(objectArray)
            % self.endPropertyCallbacksFrom(objectCellArray)
            %
            % <Inputs>
            % objects - object handle(s) or cell array of handles which
            %           will be checked for updates
            isObject = @(target) any(target == objects);
            for listener = self.Listeners
                listener.Object = cell.remove(isObject, listener.Object);
                
                if isempty(listener.Object)
                    listener.delete();
                end
            end
            self.removeInvalidListeners();
        end
        
        function self = endPropertyCallbacksWith(self, callback)
            % Clears all callbacks that call the given function handle.
            %
            % <Usage>
            % self.endPropertyCallbacksWith(callback)
            %
            % <Inputs>
            % objects - object handle(s) or cell array of handles which
            %           will be checked for updates
            for listener = self.Listeners
                if isequal(listener.Callback, callback)
                    listener.delete();
                end
            end
            self.removeInvalidListeners();
        end
    end
    
    methods (Access = private)
        function removeInvalidListeners(self)
            self.Listeners = self.Listeners(isvalid(self.Listeners));
        end
    end
end

function metaProperties = metaPropertiesByName(objects, names)
if ischar(names)
    names = {names};
end

metaClass = metaclass(objects);
metaProperties = cell(size(names));
for property = each(metaClass.PropertyList)
    index = strcmp(property.Name, names);
    
    if any(index)
        metaProperties{index} = property;
    end
end
end

