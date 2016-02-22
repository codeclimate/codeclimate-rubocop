This cop checks the indentation of the first parameter in a method call.
Parameters after the first one are checked by Style/AlignParameters, not
by this cop.

### Example:

    # bad
    some_method(
    first_param,
    second_param)

    # good
    some_method(
      first_param,
    second_param)