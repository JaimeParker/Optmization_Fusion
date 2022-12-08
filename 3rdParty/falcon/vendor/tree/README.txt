Extracted from first revision headers:

    DEVELOPER NOTE: Java objects that may be used in a callback must be
    put on the EDT to make them thread-safe in MATLAB. Otherwise, they
    could execute along side a MATLAB command and get into a thread-lock
    situation. Methods of the objects put on the EDT will be executed on
    the thread-safe EDT.

2016-02-25

    - Code was refactored, formatted, DND support dropped.
    - Performance updates concerning callbacks were introduced.