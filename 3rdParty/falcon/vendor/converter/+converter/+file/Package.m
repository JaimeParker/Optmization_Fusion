classdef (Abstract) Package
    %PACKAGE Maps package dependencies.
    %
    % See also Injector
    
    properties (Constant)
        fileReader = 'FileReader';
        fileWriter = 'FileWriter';
        
        reflectionUtil = 'converter.util.ReflectionUtil';
        stringUtil = 'converter.util.StringUtil';
        fileUtil = 'converter.file.FileUtil';
    end
    
    methods (Static)
        function provider = fileReaderProvider(scope)
            provider.get = @(fileName)  ...
                get(Injector(fileName), scope, 'FileReader');
        end
        
        function provider = fileWriterProvider(scope)
            provider.get = @(fileName) ...
                get(Injector(fileName), scope, 'FileWriter');
        end
        
        function reader = stringReader(injector, scope, fileExtension)
            switch fileExtension
                case 'xml'
                    reader = injector.get(scope, 'XmlReader');
            end
        end
        
        function writer = stringWriter(injector, scope, fileExtension)
            switch fileExtension
                case 'xml'
                    writer = injector.get(scope, 'XmlWriter');
            end
        end
        
        function javaYaml = javaYaml()
            javaYaml = snakeyaml('DefaultFlowStyle', 'BLOCK');
        end
        
        function fileExtension = fileExtension(fileName)
            [~, ~, fileExtension] = fileparts(lower(fileName));
            fileExtension = fileExtension(2:end);
        end
        
        function extensions = knownFileExtensions()
            extensions = {'.xml'};
        end
    end
end

