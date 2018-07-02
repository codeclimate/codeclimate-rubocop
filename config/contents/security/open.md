This cop checks for the use of `Kernel#open`.
`Kernel#open` enables not only file access but also process invocation
by prefixing a pipe symbol (e.g., `open("| ls")`).  So, it may lead to
a serious security risk by using variable input to the argument of
`Kernel#open`.  It would be better to use `File.open` or `IO.popen`
explicitly.

### Example:
    # bad
    open(something)

    # good
    File.open(something)
    IO.popen(something)