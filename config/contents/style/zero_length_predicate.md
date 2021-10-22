This cop checks for numeric comparisons that can be replaced
by a predicate method, such as receiver.length == 0,
receiver.length > 0, receiver.length != 0,
receiver.length < 1 and receiver.size == 0 that can be
replaced by receiver.empty? and !receiver.empty?.

### Safety:

This cop is unsafe because it cannot be guaranteed that the receiver
has an `empty?` method that is defined in terms of `length`. If there
is a non-standard class that redefines `length` or `empty?`, the cop
may register a false positive.

### Example:
    # bad
    [1, 2, 3].length == 0
    0 == "foobar".length
    array.length < 1
    {a: 1, b: 2}.length != 0
    string.length > 0
    hash.size > 0

    # good
    [1, 2, 3].empty?
    "foobar".empty?
    array.empty?
    !{a: 1, b: 2}.empty?
    !string.empty?
    !hash.empty?