# Matlab Wrapper Class Library

Copyright © 2021-2022 TUM Institute of Flight System Dynamics.

## Description

### Introduction

Many Matlab core features require dealing with low-level data structures and
resource handles.  Usually, code using these features is inconvenient to write
and read as well as potentially unsafe and error-prone.

This library intends to provide more convenient and safe access to such
functionalities by implementing wrapper classes.  These shall adhere to the
following guidelines:
- [RAII](https://en.wikipedia.org/wiki/Resource_acquisition_is_initialization)
  resource management
- Throw exceptions instead of returning error codes
- …

### Library

- [`wrap.fs`](./+wrap/+fs/INFO.md): Filesystem access (file resource wrappers)
- [`wrap.io`](./+wrap/+io/INFO.md): Input/output interfaces
- [`wrap.sys`](./+wrap/+sys/INFO.md): Operating system interface (shell commands, …)
- [`wrap.var`](./+wrap/+var/INFO.md): Variable/data wrappers
- [`wrap.ctx`](./+wrap/+ctx/INFO.md): Context guard objects
- [`wrap.err`](./+wrap/+err/INFO.md): Exceptions

### Compatibility

Matlab >= R2019b
