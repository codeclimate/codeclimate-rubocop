This cop checks that arrays are sliced with endless ranges instead of
`ary[start..-1]` on Ruby 2.6+.

### Example:
    # bad
    items[1..-1]

    # good
    items[1..]