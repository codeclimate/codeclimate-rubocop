This cop checks for uses of `and` and `or`, and suggests using `&&` and
`|| instead`. It can be configured to check only in conditions, or in
all contexts.

### Example:

    # EnforcedStyle: always (default)

    # good
    foo.save && return
    if foo && bar

    # bad
    foo.save and return
    if foo and bar

### Example:

    # EnforcedStyle: conditionals

    # good
    foo.save && return
    foo.save and return
    if foo && bar

    # bad
    if foo and bar