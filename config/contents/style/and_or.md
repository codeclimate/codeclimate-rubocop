This cop checks for uses of `and` and `or`, and suggests using `&&` and
`||` instead. It can be configured to check only in conditions or in
all contexts.

It is marked as unsafe auto-correction because it may change the
operator precedence between logical operators (`&&` and `||`) and
semantic operators (`and` and `or`).

### Example: EnforcedStyle: always
    # bad
    foo.save and return

    # bad
    if foo and bar
    end

    # good
    foo.save && return

    # good
    if foo && bar
    end

### Example: EnforcedStyle: conditionals (default)
    # bad
    if foo and bar
    end

    # good
    foo.save && return

    # good
    foo.save and return

    # good
    if foo && bar
    end