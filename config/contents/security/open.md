Checks for the use of `Kernel#open` and `URI.open` with dynamic
data.

`Kernel#open` and `URI.open` enable not only file access but also process
invocation by prefixing a pipe symbol (e.g., `open("| ls")`).
So, it may lead to a serious security risk by using variable input to
the argument of `Kernel#open` and `URI.open`. It would be better to use
`File.open`, `IO.popen` or `URI.parse#open` explicitly.

NOTE: `open` and `URI.open` with literal strings are not flagged by this
cop.

### Safety:

This cop could register false positives if `open` is redefined
in a class and then used without a receiver in that class.

### Example:
    # bad
    open(something)
    open("| #{something}")
    open("| foo")
    URI.open(something)

    # good
    File.open(something)
    IO.popen(something)
    URI.parse(something).open

    # good (literal strings)
    open("foo.text")
    URI.open("http://example.com")