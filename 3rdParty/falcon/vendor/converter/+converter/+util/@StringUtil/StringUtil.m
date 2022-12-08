classdef StringUtil
    %STRINGUTIL Wrapper for string utility methods.
    %
    % util = get(Injector, ?converter.util.StringUtil)
    %
    % See also converter.util.StringUtil/list2str,
    %          converter.util.StringUtil/log2str,
    %          converter.util.StringUtil/map2str,
    %          converter.util.StringUtil/num2str,
    %          converter.util.StringUtil/str2list,
    %          converter.util.StringUtil/str2log,
    %          converter.util.StringUtil/str2map,
    %          converter.util.StringUtil/str2num,
    %          converter.util.StringUtil/str2target
    
    properties (Access = private)
        ObjectProvider; % provider<1x1 object>
    end
    
    methods
        function self = StringUtil(objectProvider)
            self.ObjectProvider = objectProvider;
        end
    end
end

