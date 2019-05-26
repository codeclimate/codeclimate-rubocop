Here we check if the arguments on a multi-line method
definition are aligned.

### Example: EnforcedStyle: with_first_argument (default)
    # good

    foo :bar,
        :baz

    foo(
      :bar,
      :baz
    )

    # bad

    foo :bar,
      :baz

    foo(
      :bar,
        :baz
    )

### Example: EnforcedStyle: with_fixed_indentation
    # good

    foo :bar,
      :baz

    # bad

    foo :bar,
        :baz