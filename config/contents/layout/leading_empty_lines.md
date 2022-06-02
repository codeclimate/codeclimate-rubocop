Checks for unnecessary leading blank lines at the beginning
of a file.

### Example:

    # bad
    # (start of file)

    class Foo
    end

    # bad
    # (start of file)

    # a comment

    # good
    # (start of file)
    class Foo
    end

    # good
    # (start of file)
    # a comment