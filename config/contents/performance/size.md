This cop is used to identify usages of `count` on an
`Array` and `Hash` and change them to `size`.

### Example:
    # bad
    [1, 2, 3].count

    # bad
    {a: 1, b: 2, c: 3}.count

    # good
    [1, 2, 3].size

    # good
    {a: 1, b: 2, c: 3}.size

    # good
    [1, 2, 3].count { |e| e > 2 }
TODO: Add advanced detection of variables that could
have been assigned to an array or a hash.