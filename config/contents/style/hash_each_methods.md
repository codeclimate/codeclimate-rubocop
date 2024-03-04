Checks for uses of `each_key` and `each_value` Hash methods.

NOTE: If you have an array of two-element arrays, you can put
    parentheses around the block arguments to indicate that you're not
    working with a hash, and suppress RuboCop offenses.

### Safety:

This cop is unsafe because it cannot be guaranteed that the receiver
is a `Hash`. The `AllowedReceivers` configuration can mitigate,
but not fully resolve, this safety issue.

### Example:
    # bad
    hash.keys.each { |k| p k }
    hash.each { |k, unused_value| p k }

    # good
    hash.each_key { |k| p k }

    # bad
    hash.values.each { |v| p v }
    hash.each { |unused_key, v| p v }

    # good
    hash.each_value { |v| p v }

### Example: AllowedReceivers: ['execute']
    # good
    execute(sql).keys.each { |v| p v }
    execute(sql).values.each { |v| p v }