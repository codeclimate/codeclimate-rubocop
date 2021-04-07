This cop checks the usage of pre-2.1 `Hash[args]` method of converting enumerables and
sequences of values to hashes.

### Example:
    # bad
    Hash[ary]

    # good
    ary.to_h

    # bad
    Hash[key1, value1, key2, value2]

    # good
    {key1 => value1, key2 => value2}