Checks that exactly one space is used between a method name and the
first argument for method calls without parentheses.

Alternatively, extra spaces can be added to align the argument with
something on a preceding or following line, if the AllowForAlignment
config parameter is true.

### Example:
    # bad
    something  x
    something   y, z
    something'hello'

    # good
    something x
    something y, z
    something 'hello'
