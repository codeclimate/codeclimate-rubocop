Checks for endless methods.

It can enforce endless method definitions whenever possible or with single line methods.
It can also disallow multiline endless method definitions or all endless definitions.

`require_single_line` style enforces endless method definitions for single line methods.
`require_always` style enforces endless method definitions for single statement methods.

Other method definition types are not considered by this cop.

The supported styles are:

* allow_single_line (default) - only single line endless method definitions are allowed.
* allow_always - all endless method definitions are allowed.
* disallow - all endless method definitions are disallowed.
* require_single_line - endless method definitions are required for single line methods.
* require_always - all endless method definitions are required.

NOTE: Incorrect endless method definitions will always be
corrected to a multi-line definition.

### Example: EnforcedStyle: allow_single_line (default)
    # bad, multi-line endless method
    def my_method = x.foo
                     .bar
                     .baz

    # good
    def my_method
      x
    end

    # good
    def my_method = x

    # good
    def my_method
      x.foo
       .bar
       .baz
    end

### Example: EnforcedStyle: allow_always
    # good
    def my_method
      x
    end

    # good
    def my_method = x

    # good
    def my_method = x.foo
                     .bar
                     .baz

    # good
    def my_method
      x.foo
       .bar
       .baz
    end

### Example: EnforcedStyle: disallow
    # bad
    def my_method = x

    # bad
    def my_method = x.foo
                     .bar
                     .baz

    # good
    def my_method
      x
    end

    # good
    def my_method
      x.foo
       .bar
       .baz
    end

### Example: EnforcedStyle: require_single_line
    # bad
    def my_method
      x
    end

    # bad
    def my_method = x.foo
                     .bar
                     .baz

    # good
    def my_method = x

    # good
    def my_method
      x.foo
       .bar
       .baz
    end

### Example: EnforcedStyle: require_always
    # bad
    def my_method
      x
    end

    # bad
    def my_method
      x.foo
       .bar
       .baz
    end

    # good
    def my_method = x

    # good
    def my_method = x.foo
                     .bar
                     .baz
