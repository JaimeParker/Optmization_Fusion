# The `wrap.io` library

## Resource wrapper for file handles: `wrap.io.File`

The `File` resource wrapper implements RAII semantics for file handles.  It
implements the basic interfaces `fwrite()`, `fprintf()`, `fread()`, `fscanf()`,
`fseek()`, `ftell()`, `ferror()`, `feof()`, `frewind()`, `fgetl()` and
`fgets()`; these method calls are passed through to the stored file handle.
For methods that return status information, `File` checks the status flag and
throws `wrap.io.IoError` if an error is detected.

In addition to the basics, the `fileread()` method is provided.

The `File` class can be used almost as a drop-in replacement for raw file
handles; the constructor accepts the same arguments as `fopen()`.
Additionally, a `wrap.fs.Path` argument is accepted in place of the filename.

Benefit: On destruction the wrapper automatically closes the stored file
handle, thereby preventing resource leaks.

Example:
```matlab
f = wrap.io.File("output.txt", "w");
fprintf(f, "%s", "Hello, world!");
```

## Matlab expression serializer: `wrap.io.MatlabExpressionSerializer`

The `MatlabExpressionSerializer` generates Matlab source code expressions from
given variables.  It aims to generate code that reproduces the input data
exactly.  In contrast to `matlab.io.saveVariablesToScript`, only a single
Matlab expression is generated.  Support is limited to basic Matlab types;
handle classes cannot be handled.  Support for custom value classes can be
added by implementing additional serialization interfaces and adding them to a
serializer object.

Example:
```matlab
s = wrap.io.MatlabExpressionSerializer();
s.serialize(struct("a", 1, "b", int16(magic(3)), "c", struct("d", 'x', "e", pi)))
```
