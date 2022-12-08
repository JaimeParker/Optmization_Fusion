function propertyNames = properties(~, objectOrStruct)
%PROPERTIES - Returns public settable property names.
%
% propertyNames = reflectionUtil.properties(objectOrStruct)
%
% If the input is an object, it retrieves all property names via the
% properties() method and further excludes all non-settable names. The list
% of non-settable names is retrieved from the corresponding meta.class.
%
% If the input is a struct, the fieldnames() are returned.
%
% See also fieldnames, properties, meta.class, meta.property

if isstruct(objectOrStruct)
    propertyNames = fieldnames(objectOrStruct)';
else
    metaClass = metaclass(objectOrStruct);
    
    metaProperties = metaClass.PropertyList';
    areSettable = strcmp({metaProperties.SetAccess}, 'public');
    areConstant = [metaProperties.Constant];
    
    excludedProperties = {metaProperties(~areSettable | areConstant).Name};
    realProperties = properties(objectOrStruct);
    propertyNames = setdiff(realProperties, excludedProperties);
end

if isempty(propertyNames)
    propertyNames = {};
end
end

