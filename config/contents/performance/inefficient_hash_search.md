This cop checks for inefficient searching of keys and values within
hashes.

`Hash#keys.include?` is less efficient than `Hash#key?` because
the former allocates a new array and then performs an O(n) search
through that array, while `Hash#key?` does not allocate any array and
performs a faster O(1) search for the key.

`Hash#values.include?` is less efficient than `Hash#value?`. While they
both perform an O(n) search through all of the values, calling `values`
allocates a new array while using `value?` does not.

### Example:
    # bad
    { a: 1, b: 2 }.keys.include?(:a)
    { a: 1, b: 2 }.keys.include?(:z)
    h = { a: 1, b: 2 }; h.keys.include?(100)

    # good
    { a: 1, b: 2 }.key?(:a)
    { a: 1, b: 2 }.has_key?(:z)
    h = { a: 1, b: 2 }; h.key?(100)

    # bad
    { a: 1, b: 2 }.values.include?(2)
    { a: 1, b: 2 }.values.include?('garbage')
    h = { a: 1, b: 2 }; h.values.include?(nil)

    # good
    { a: 1, b: 2 }.value?(2)
    { a: 1, b: 2 }.has_value?('garbage')
    h = { a: 1, b: 2 }; h.value?(nil)
