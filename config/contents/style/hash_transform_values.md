Looks for uses of `\_.each_with_object({}) {...}`,
`\_.map {...}.to_h`, and `Hash[\_.map {...}]` that are actually just
transforming the values of a hash, and tries to use a simpler & faster
call to `transform_values` instead.

### Safety:

This cop is unsafe, as it can produce false positives if we are
transforming an enumerable of key-value-like pairs that isn't actually
a hash, e.g.: `[[k1, v1], [k2, v2], ...]`

### Example:
    # bad
    {a: 1, b: 2}.each_with_object({}) { |(k, v), h| h[k] = foo(v) }
    Hash[{a: 1, b: 2}.collect { |k, v| [k, foo(v)] }]
    {a: 1, b: 2}.map { |k, v| [k, v * v] }.to_h
    {a: 1, b: 2}.to_h { |k, v| [k, v * v] }

    # good
    {a: 1, b: 2}.transform_values { |v| foo(v) }
    {a: 1, b: 2}.transform_values { |v| v * v }