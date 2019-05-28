Here we check if the parameters on a multi-line method call or
definition are aligned.

To set the alignment of the first argument, use the cop
FirstParameterIndentation.

### Example: EnforcedStyle: with_first_parameter (default)
    # good

    def foo(bar,
            baz)
      123
    end

    def foo(
      bar,
      baz
    )
      123
    end

    # bad

    def foo(bar,
         baz)
      123
    end

    # bad

    def foo(
      bar,
         baz)
      123
    end

### Example: EnforcedStyle: with_fixed_indentation
    # good

    def foo(bar,
      baz)
      123
    end

    def foo(
      bar,
      baz
    )
      123
    end

    # bad

    def foo(bar,
            baz)
      123
    end

    # bad

    def foo(
      bar,
         baz)
      123
    end