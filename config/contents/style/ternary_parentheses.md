Checks for the presence of parentheses around ternary
conditions. It is configurable to enforce inclusion or omission of
parentheses using `EnforcedStyle`. Omission is only enforced when
removing the parentheses won't cause a different behavior.

`AllowSafeAssignment` option for safe assignment.
By safe assignment we mean putting parentheses around
an assignment to indicate "I know I'm using an assignment
as a condition. It's not a mistake."

### Example: EnforcedStyle: require_no_parentheses (default)
    # bad
    foo = (bar?) ? a : b
    foo = (bar.baz?) ? a : b
    foo = (bar && baz) ? a : b

    # good
    foo = bar? ? a : b
    foo = bar.baz? ? a : b
    foo = bar && baz ? a : b

### Example: EnforcedStyle: require_parentheses
    # bad
    foo = bar? ? a : b
    foo = bar.baz? ? a : b
    foo = bar && baz ? a : b

    # good
    foo = (bar?) ? a : b
    foo = (bar.baz?) ? a : b
    foo = (bar && baz) ? a : b

### Example: EnforcedStyle: require_parentheses_when_complex
    # bad
    foo = (bar?) ? a : b
    foo = (bar.baz?) ? a : b
    foo = bar && baz ? a : b

    # good
    foo = bar? ? a : b
    foo = bar.baz? ? a : b
    foo = (bar && baz) ? a : b

### Example: AllowSafeAssignment: true (default)
    # good
    foo = (bar = baz) ? a : b

### Example: AllowSafeAssignment: false
    # bad
    foo = (bar = baz) ? a : b
