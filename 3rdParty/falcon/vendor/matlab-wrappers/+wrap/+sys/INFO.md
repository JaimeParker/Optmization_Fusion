# Operating system interface library `wrap.sys`

## Somewhat safe shell commands: `wrap.sys.ShellCommand`

The standard `system()` function is highly unsafe, because it takes a single
string that includes an arbitrary shell command and its arguments.  It is up to
the user to properly escape all components of this shell command; Matlab does
not even provide functions for this.

This wrapper class takes the individual words/arguments of a shell command and
escapes the commandline based on a given shell escape style, defaulting to
Windows Cmd (plus C runtime conventions) on Windows and to standard Unix rules
(Bourne shell) on GNU/Linux and MacOS.

When the command is run, the escaped commandline is passed to `system()` and
executed using the host system shell.  Return codes and standard output are
captured and provided as attributes of the result object.

Example:
```matlab
wrap.sys.ShellCommand(["echo", "$HOSTNAME", "%PATH%", "&", "a;b"]).run().check().Output
% returns: "$HOSTNAME %PATH% & a;b" + newline()
```

To format a command for a different host system, explicitly specify the escape
style:
```matlab
wrap.sys.ShellCommand(["echo", "a b c"]).withStyle(wrap.sys.UnixShellEscapeStyle()).EscapedCommandLine
% returns: echo a\ b\ c
wrap.sys.ShellCommand(["echo", "a b c"]).withStyle(wrap.sys.WindowsCmdShellEscapeStyle()).EscapedCommandLine
% returns: echo ^"a^ b^ c^"
```
