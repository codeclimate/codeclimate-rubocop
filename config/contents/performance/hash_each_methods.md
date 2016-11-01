This cop checks for uses of `each_key` & `each_value` Hash methods.

### Example:
    # bad
    hash.keys.each { |k| p k }
    hash.values.each { |v| p v }
    hash.each { |k, _v| p k }
    hash.each { |_k, v| p v }

    # good
    hash.each_key { |k| p k }
    hash.each_value { |v| p v }