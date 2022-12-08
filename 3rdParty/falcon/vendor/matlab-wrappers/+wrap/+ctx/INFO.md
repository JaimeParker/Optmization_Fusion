# Context guard library `wrap.ctx`

The context guard objects store aspects of the current execution context on
construction and restore them on destruction.  This way, rolling back temporary
changes becomes very convenient and safe, since it is not necessary to think
through the required cleanup actions for every possible execution path.  In
particular, error conditions are covered automatically.

The basic pattern is the following:
```matlab
function work()
  ctx = wrap.ctx.<ContextGuard>();  %#ok<NASGU>
  % [...]
  % automatic cleanup on return or error
end
```

The context guard object `ctx` lives until the function returns, either by
reaching the end of the function or by a return statement or due to an error.
At this point, `ctx` is destructed and performs the respective cleanup action.
Of course, `ctx` can also be returned in an output argument or stored in an
object property if it needs to outlive the function or method where it is
created.

## Working directory context: `wrap.ctx.WorkingDirectoryContext`

Stores the current working directory on construction and restores it on
destruction.

Example:
```matlab
function workInDirectory(directory)
  import wrap.ctx.WorkingDirectoryContext;
  ctx = WorkingDirectoryContext();  %#ok<NASGU>
  cd(directory);
  % [...]
  % automatic cleanup on return or error
end
```

## Matlab path context: `wrap.ctx.PathContext`

Stores the current Matlab search path on construction and restores it on
destruction.

Example:
```matlab
function workWithCodeFrom(directory)
    import wrap.ctx.PathContext;
    ctx = PathContext();  %#ok<NASGU>
    addpath(directory);
    % [...]
    % automatic cleanup on return or error
end
```

## Symbolic assumptions context: `wrap.ctx.AssumptionContext`

Stores the current set of *Symbolic Math Toolbox* assumptions on construction
and restores it on destruction.

Note: If the symbolic math engine is reset, all symbolic items are irreversibly
lost.

Example:
```matlab
function workWithSyms(x, y)
  import wrap.ctx.AssumptionContext;
  ctx = AssumptionContext();  %#ok<NASGU>
  assumeAlso(x < y);
  % [...]
  % automatic cleanup on return or error
end
```

## Diary (log file) context: `wrap.ctx.DiaryContext`

Stores the current Matlab *diary* (log file) state and restores it on
destruction.

Example:
```matlab
function work()
  import wrap.ctx.DiaryContext;
  ctx = DiaryContext();  %#ok<NASGU>
  diary("work_log.txt");
  fprintf("Working ...\n");
  % [...]
  % log file is automatically closed on return or error
end
```
