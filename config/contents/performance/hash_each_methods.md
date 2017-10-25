This cop checks for uses of `each_key` and `each_value` Hash methods.

Note: If you have an array of two-element arrays, you can put
    parentheses around the block arguments to indicate that you're not
    working with a hash, and supress RuboCop offenses.

### Example:
    # bad
    hash.keys.each { |k| p k }
    hash.values.each { |v| p v }
    hash.each { |k, _v| p k }
    hash.each { |_k, v| p v }

    # good
    hash.each_key { |k| p k }
    hash.each_value { |v| p v }