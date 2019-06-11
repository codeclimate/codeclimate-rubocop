Here we check if the parameters on a multi-line method call or
definition are aligned.

### Example: EnforcedStyle: with_first_parameter (default)
    # good

    foo :bar,
        :baz

    # bad

    foo :bar,
      :baz

### Example: EnforcedStyle: with_fixed_indentation
    # good

    foo :bar,
      :baz

    # bad

    foo :bar,
        :baz