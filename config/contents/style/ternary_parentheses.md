This cop checks for the presence of parentheses around ternary
conditions. It is configurable to enforce inclusion or omission of
parentheses using `EnforcedStyle`. Omission is only enforced when
removing the parentheses won't cause a different behavior.

### Example:

    EnforcedStyle: require_no_parentheses (default)

    # bad
    foo = (bar?) ? a : b
    foo = (bar.baz?) ? a : b
    foo = (bar && baz) ? a : b

    # good
    foo = bar? ? a : b
    foo = bar.baz? ? a : b
    foo = bar && baz ? a : b

### Example:

    EnforcedStyle: require_parentheses

    # bad
    foo = bar? ? a : b
    foo = bar.baz? ? a : b
    foo = bar && baz ? a : b

    # good
    foo = (bar?) ? a : b
    foo = (bar.baz?) ? a : b
    foo = (bar && baz) ? a : b

### Example:

    EnforcedStyle: require_parentheses_when_complex

    # bad
    foo = (bar?) ? a : b
    foo = (bar.baz?) ? a : b
    foo = bar && baz ? a : b

    # good
    foo = bar? ? a : b
    foo = bar.baz? ? a : b
    foo = (bar && baz) ? a : b