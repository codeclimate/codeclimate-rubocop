Enforces the use of `Array#push(item)` instead of `Array#concat([item])`
to avoid redundant array literals.

### Safety:

This cop is unsafe, as it can produce false positives if the receiver
is not an `Array` object.

### Example:

    # bad
    list.concat([foo])
    list.concat([bar, baz])
    list.concat([qux, quux], [corge])

    # good
    list.push(foo)
    list.push(bar, baz)
    list.push(qux, quux, corge)
