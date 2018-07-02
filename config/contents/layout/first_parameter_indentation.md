This cop checks the indentation of the first parameter in a method call.
Parameters after the first one are checked by Layout/AlignParameters,
not by this cop.

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

    # Style: consistent

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

    # Style: consistent_relative_to_receiver

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

    # Style: special_for_inner_method_call

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

    # Style: special_for_inner_method_call_in_parentheses

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
