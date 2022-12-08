# Variable wrappers and utilities library `wrap.var`

## Optional values: `wrap.var.Optional`

The `wrap.var.Optional` class wraps around an object/value of any type similar
to C++'s `std::optional<T>`.

Benefits: Pass or return optional data wrapped in `Optional` to force the
receiver to explicitly deal with missing data.  Trigger easily understandable
exceptions if undefined values are accessed instead of size or type errors
somewhere downstream.

Example:
```matlab
x = Optional(pi);
y = Optional();

x.value_or(0)  % returns pi
y.value_or(1)  % returns 1
x.has_value()  % returns true
y.has_value()  % returns false
x.value()      % returns pi
y.value()      % throws wrap.var.UndefinedValueError
```

Example 2:
```matlab
function [ result ] = find_first(array, entry)
    import wrap.var.Optional;
    index = find(array, entry, 1, "first");
    if isempty(index)
        return Optional();
    end
    return Optional(index);
end

x = 1 : 5;
find_first(x, pi).value_or(1)  % Returns 1
```

## Shared values: `wrap.var.Shared`

To share access to data with value semantics, wrap it in the `wrap.var.Shared`
handle class.

Example:
```matlab
x = 0
y = x  % x == 0, y == 0
x = 1  % x == 1, y == 0

x = Shared(0)
y = x         % x.Value = 0, y.Value = 0
x.Value = 1   % x.Value = 1, y.Value = 1
```

## Stacks: `wrap.var.Stack`

LIFO.

```matlab
x = wrap.var.Stack();
x.push(0)
x.push(1)
x.push(2)
x.pop()  % returns 2
x.pop()  % returns 1
x.pop()  % returns 0
```

## Merging structs: `wrap.var.StructMerge`

Merge structs with optional recursion, field type and size checks or rejection
of conflicting fields.

Example:
```matlab
x = struct('a', struct('aa', struct('aaa', 1, 'aab', 2), 'ab', struct('aba', 3, 'abb', 4)));
y = struct('a', struct('aa', struct('aaa', 5)));
m = wrap.var.StructMerge();
m.merge({x, y})  % returns struct('a', struct('aa', struct('aaa', 5, 'aab', 2), 'ab', struct('aba', 3, 'abb', 4)))
```

## Utilities: `wrap.var.map_array()` and `wrap.var.map_cell()`

Convenience wrappers for `arrayfun()` and `cellfun()`:
- `map_array()` returns an array; the input may be an array or cell
- `map_cell()` returns a cell; the input may be an array or cell
