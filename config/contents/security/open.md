This cop checks for the use of `Kernel#open` and `URI.open`.

`Kernel#open` and `URI.open` enable not only file access but also process
invocation by prefixing a pipe symbol (e.g., `open("| ls")`).
So, it may lead to a serious security risk by using variable input to
the argument of `Kernel#open` and `URI.open`. It would be better to use
`File.open`, `IO.popen` or `URI.parse#open` explicitly.

### Example:
    # bad
    open(something)
    URI.open(something)

    # good
    File.open(something)
    IO.popen(something)
    URI.parse(something).open