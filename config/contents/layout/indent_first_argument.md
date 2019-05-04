This cop checks the indentation of the first argument in a method call
or definition.

### Example:

    # bad
    some_method(
    first_param,
    second_param)

    foo = some_method(
    first_param,
    second_param)

    foo = some_method(nested_call(
    nested_first_param),
    second_param)

    foo = some_method(
    nested_call(
    nested_first_param),
    second_param)

    some_method nested_call(
    nested_first_param),
    second_param

### Example: EnforcedStyle: consistent
    # The first argument should always be indented one step more than the
    # preceding line.

    # good
    some_method(
      first_param,
    second_param)

    foo = some_method(
      first_param,
    second_param)

    foo = some_method(nested_call(
      nested_first_param),
    second_param)

    foo = some_method(
      nested_call(
        nested_first_param),
    second_param)

    some_method nested_call(
      nested_first_param),
    second_param

### Example: EnforcedStyle: consistent_relative_to_receiver
    # The first argument should always be indented one level relative to
    # the parent that is receiving the argument

    # good
    some_method(
      first_param,
    second_param)

    foo = some_method(
            first_param,
    second_param)

    foo = some_method(nested_call(
                        nested_first_param),
    second_param)

    foo = some_method(
            nested_call(
              nested_first_param),
    second_param)

    some_method nested_call(
                  nested_first_param),
    second_params

### Example: EnforcedStyle: special_for_inner_method_call
    # The first argument should normally be indented one step more than
    # the preceding line, but if it's a argument for a method call that
    # is itself a argument in a method call, then the inner argument
    # should be indented relative to the inner method.

    # good
    some_method(
      first_param,
    second_param)

    foo = some_method(
      first_param,
    second_param)

    foo = some_method(nested_call(
                        nested_first_param),
    second_param)

    foo = some_method(
      nested_call(
        nested_first_param),
    second_param)

    some_method nested_call(
                  nested_first_param),
    second_param

### Example: EnforcedStyle: special_for_inner_method_call_in_parentheses (default)
    # Same as `special_for_inner_method_call` except that the special rule
    # only applies if the outer method call encloses its arguments in
    # parentheses.

    # good
    some_method(
      first_param,
    second_param)

    foo = some_method(
      first_param,
    second_param)

    foo = some_method(nested_call(
                        nested_first_param),
    second_param)

    foo = some_method(
      nested_call(
        nested_first_param),
    second_param)

    some_method nested_call(
      nested_first_param),
    second_param
