classdef (Abstract) Package
    %PACKAGE Maps package dependencies.
    %
    % See also Injector
    
    properties (Constant)
        context = 'Context';
    end
    
    methods (Static)
        function provider = windowProvider(scope)
            provider.get = @(intent) get(Injector(intent), scope, 'window');
        end
        
        function provider = hashProvider()
            provider.get = @DataHash;
        end
        
        function window = window(injector, windowType, scope)
            window = injector.get(scope, windowType);
        end
        
        function args = arguments(intent)
            args = intent.Arguments;
        end
        
        function windowType = windowType(intent)
            windowType = intent.WindowType;
        end
        
        function data = data(intent)
            data = intent.Data;
        end
    end
end

