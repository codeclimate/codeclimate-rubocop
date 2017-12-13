This cop checks for the use of strings as keys in hashes. The use of
symbols is preferred instead.

### Example:
    # bad
    { 'one' => 1, 'two' => 2, 'three' => 3 }

    # good
    { one: 1, two: 2, three: 3 }