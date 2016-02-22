This cop checks for receiver.length == 0 predicates and the
negated versions receiver.length > 0 and receiver.length != 0.
These can be replaced with receiver.empty? and
!receiver.empty? respectively.

### Example:

    # bad
    [1, 2, 3].length == 0
    0 == "foobar".length
    hash.size > 0

    # good
    [1, 2, 3].empty?
    "foobar".empty?
    !hash.empty?