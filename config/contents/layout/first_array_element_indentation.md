Checks the indentation of the first element in an array literal
where the opening bracket and the first element are on separate lines.
The other elements' indentations are handled by `Layout/ArrayAlignment` cop.

This cop will respect `Layout/ArrayAlignment` and will not work when
`EnforcedStyle: with_fixed_indentation` is specified for `Layout/ArrayAlignment`.

By default, array literals that are arguments in a method call with
parentheses, and where the opening square bracket of the array is on the
same line as the opening parenthesis of the method call, shall have
their first element indented one step (two spaces) more than the
position inside the opening parenthesis.

Other array literals shall have their first element indented one step
more than the start of the line where the opening square bracket is.

This default style is called 'special_inside_parentheses'. Alternative
styles are 'consistent' and 'align_brackets'. Here are examples:

### Example: EnforcedStyle: special_inside_parentheses (default)
    # The `special_inside_parentheses` style enforces that the first
    # element in an array literal where the opening bracket and first
    # element are on separate lines is indented one step (two spaces) more
    # than the position inside the opening parenthesis.

    # bad
    array = [
      :value
    ]
    and_in_a_method_call([
      :no_difference
                         ])

    # good
    array = [
      :value
    ]
    but_in_a_method_call([
                           :its_like_this
                         ])

### Example: EnforcedStyle: consistent
    # The `consistent` style enforces that the first element in an array
    # literal where the opening bracket and the first element are on
    # separate lines is indented the same as an array literal which is not
    # defined inside a method call.

    # bad
    # consistent
    array = [
      :value
    ]
    but_in_a_method_call([
                           :its_like_this
    ])

    # good
    array = [
      :value
    ]
    and_in_a_method_call([
      :no_difference
    ])

### Example: EnforcedStyle: align_brackets
    # The `align_brackets` style enforces that the opening and closing
    # brackets are indented to the same position.

    # bad
    # align_brackets
    and_now_for_something = [
                              :completely_different
    ]

    # good
    # align_brackets
    and_now_for_something = [
                              :completely_different
                            ]