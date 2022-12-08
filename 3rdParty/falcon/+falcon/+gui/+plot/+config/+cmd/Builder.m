classdef Builder < falcon.core.Handle
    % Builds falcon.gui.plot.config.cmd.Command instances.
    %  
    % <Description>
    % This class provides a fluent interface, all method calls can be
    % chained, see usage section. The given example creates an Update
    % command first, a Remove command next and an Insert command last. All
    % three commands are then wrapped inside a Composite command. With the
    % call to andApply(), the command is executed and added to the
    % commandHistory where it can be undone or redone.
    %  
    % <Syntax>
    % builder = commandHistory.do()
    % builder.update(handle, 'MyProp').with(value).and() ...
    %        .remove(handle, 'MyList').atIndex(index).and() ...
    %        .insert(handle, 'MyList').value(item).atIndex(index).andApply()

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
        function andApply(self)
        % Finishes the command, executes it and resets.
        %  
        % <Syntax>
        % builder.update(...).with(value).andApply()
        end

        function self = and(self)
        % Chains one more operation to the current command.
        %  
        % <Syntax>
        % builder.remove(...).atIndex(index).and().insert(...).value(item)
        %  
        % <Outputs>
        % > self: builder instance for method chaining
        end

        function self = remove(self, object, property)
        % The next command will remove an item.
        %  
        % <Syntax>
        % builder.remove(object, property).atIndex(index)
        %  
        % <Inputs>
        % > object: handle that will be modified by the next command
        % > property: property name that will be modified
        %  
        % <Outputs>
        % > self: builder instance for method chaining
        end

        function self = insert(self, object, property)
        % The next command will insert an item.
        %  
        % <Syntax>
        % builder.insert(object, property).value(value)
        %  
        % <Inputs>
        % > object: handle that will be modified by the next command
        % > property: property name that will be modified
        %  
        % <Outputs>
        % > self: builder instance for method chaining
        end

        function self = update(self, object, property)
        % The next command will update the given handle property.
        %  
        % <Syntax>
        % builder.update(object, property).with(value)
        %  
        % <Inputs>
        % > object: object that will be modified by the next command
        % > property: property name that will be modified
        %  
        % <Outputs>
        % > self: builder instance for method chaining
        end

        function self = atIndex(self, index)
        % Defines the index where the value will be inserted.
        %  
        % <Syntax>
        % builder.insert(object, property).value(value).atIndex(index)
        %  
        % <Inputs>
        % > index: the value will be inserted like
        %         [list(1:index-1), {value}, list(index:end)]
        %  
        % <Outputs>
        % > self: builder instance for method chaining
        end

        function self = value(self, value)
        % Defines the value that will be inserted.
        %  
        % <Syntax>
        % builder.insert(object, property).value(value).atIndex(index)
        %  
        % <Inputs>
        % > value: the replacement value
        %  
        % <Outputs>
        % > self: builder instance for method chaining
        end

        function self = with(self, value)
        % Defines the update value.
        %  
        % <Syntax>
        % builder.update(object, property).with(value)
        %  
        % <Inputs>
        % > value: the replacement value
        %  
        % <Outputs>
        % > self: builder instance for method chaining
        end

        function self = reset(self)
        % Resets the state of the builder.
        %  
        % <Outputs>
        % > self: builder instance for method chaining
        end

        function self = Builder(updateCommandProvider, insertCommandProvider, removeCommandProvider, compositeCommandProvider)
        % Builds falcon.gui.plot.config.cmd.Command instances.
        %  
        % <Description>
        % This class provides a fluent interface, all method calls can be
        % chained, see usage section. The given example creates an Update
        % command first, a Remove command next and an Insert command last. All
        % three commands are then wrapped inside a Composite command. With the
        % call to andApply(), the command is executed and added to the
        % commandHistory where it can be undone or redone.
        %  
        % <Syntax>
        % builder = commandHistory.do()
        % builder.update(handle, 'MyProp').with(value).and() ...
        %        .remove(handle, 'MyList').atIndex(index).and() ...
        %        .insert(handle, 'MyList').value(item).atIndex(index).andApply()
        end

    end

end