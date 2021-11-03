This cop checks for the use of strings as keys in hashes. The use of
symbols is preferred instead.

### Safety:

This cop is unsafe because while symbols are preferred for hash keys,
there are instances when string keys are required.

### Example:
    # bad
    { 'one' => 1, 'two' => 2, 'three' => 3 }

    # good
    { one: 1, two: 2, three: 3 }