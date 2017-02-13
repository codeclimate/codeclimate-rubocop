This cop checks whether the end keywords of method definitions are
aligned properly.

Two modes are supported through the EnforcedStyleAlignWith configuration
parameter. If it's set to `start_of_line` (which is the default), the
`end` shall be aligned with the start of the line where the `def`
keyword is. If it's set to `def`, the `end` shall be aligned with the
`def` keyword.

### Example:

    # bad

    private def foo
                end

### Example:

    # EnforcedStyleAlignWith: start_of_line (default)

    # good

    private def foo
    end

### Example:

    # EnforcedStyleAlignWith: def

    # good

    private def foo
            end