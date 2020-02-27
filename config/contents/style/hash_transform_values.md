This cop looks for uses of `_.each_with_object({}) {...}`,
`_.map {...}.to_h`, and `Hash[_.map {...}]` that are actually just
transforming the values of a hash, and tries to use a simpler & faster
call to `transform_values` instead.

This can produce false positives if we are transforming an enumerable
of key-value-like pairs that isn't actually a hash, e.g.:
`[[k1, v1], [k2, v2], ...]`

This cop should only be enabled on Ruby version 2.4 or newer
(`transform_values` was added in Ruby 2.4.)

### Example:
    # bad
    {a: 1, b: 2}.each_with_object({}) { |(k, v), h| h[k] = foo(v) }
    {a: 1, b: 2}.map { |k, v| [k, v * v] }

    # good
    {a: 1, b: 2}.transform_values { |v| foo(v) }
    {a: 1, b: 2}.transform_values { |v| v * v }