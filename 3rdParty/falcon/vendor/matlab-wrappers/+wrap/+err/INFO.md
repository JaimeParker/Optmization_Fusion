# Exception library: `wrap.err`

## `wrap.err.IncompleteSwitchError`

Every `switch` statement should end with an `otherwise` branch that throws an
error.  This exception class provides a generic error message.  It is intended
primarily for situations where the error is unexpected, for example when
branching based on enumeration values, where changes to enumeration definitions
may lead to unexpected and potentially hidden issues in unrelated code.

Example:
```matlab
switch value
case 0
  handle_0()
case 1
  handle_1()
otherwise
  throw(wrap.err.IncompleteSwitchError(value));
end
```

## `wrap.err.SizeMismatchError`

The `SizeMismatchError` class provides a generic error message in case of size
mismatch between two variables.  Size information is included to provide useful
feedback to the user.

Example:
```matlab
x = zeros(3, 1);
y = zeros(1, 3);
wrap.err.SizeMismatchError.throw_unless_same_size(x, y)
% --> Size mismatch: size(A) == [3 1] vs. size(B) == [1 3]
wrap.err.SizeMismatchError.throw_unless_same_size(x, y, "x", "y")
% --> Size mismatch: size(x) == [3 1] vs. size(y) == [1 3]
```
