This cop checks for optional arguments to methods
that do not come at the end of the argument list.

### Safety:

This cop is unsafe because changing a method signature will
implicitly change behaviour.

### Example:
    # bad
    def foo(a = 1, b, c)
    end

    # good
    def baz(a, b, c = 1)
    end

    def foobar(a = 1, b = 2, c = 3)
    end