Checks for method signatures that span multiple lines.

### Example:

    # good

    def foo(bar, baz)
    end

    # bad

    def foo(bar,
            baz)
    end
