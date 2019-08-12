This cop checks the indentation of the first parameter in a method
definition. Parameters after the first one are checked by
Layout/AlignParameters, not by this cop.

For indenting the first argument of method *calls*, check out
Layout/IndentFirstArgument, which supports options related to
nesting that are irrelevant for method *definitions*.

### Example:

    # bad
    def some_method(
    first_param,
    second_param)
      123
    end

### Example: EnforcedStyle: consistent (default)
    # The first parameter should always be indented one step more than the
    # preceding line.

    # good
    def some_method(
      first_param,
    second_param)
      123
    end

### Example: EnforcedStyle: align_parentheses
    # The first parameter should always be indented one step more than the
    # opening parenthesis.

    # good
    def some_method(
                     first_param,
    second_param)
      123
    end