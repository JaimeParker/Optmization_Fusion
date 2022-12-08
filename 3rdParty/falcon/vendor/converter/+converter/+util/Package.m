classdef (Abstract) Package
    %PACKAGE Maps package dependencies.
    %
    % See also Injector
    
    methods (Static)
        function provider = objectProvider()
            provider.get = @(charValue, targetType) ...
                get(Injector(charValue), targetType);
        end
    end
end

