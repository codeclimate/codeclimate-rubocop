Looks for uses of `\_.each_with_object({}) {...}`,
`\_.map {...}.to_h`, and `Hash[\_.map {...}]` that are actually just
transforming the keys of a hash, and tries to use a simpler & faster
call to `transform_keys` instead.
It should only be enabled on Ruby version 2.5 or newer.
(`transform_keys` was added in Ruby 2.5.)

### Safety:

This cop is unsafe, as it can produce false positives if we are
transforming an enumerable of key-value-like pairs that isn't actually
a hash, e.g.: `[[k1, v1], [k2, v2], ...]`

### Example:
    # bad
    {a: 1, b: 2}.each_with_object({}) { |(k, v), h| h[foo(k)] = v }
    Hash[{a: 1, b: 2}.collect { |k, v| [foo(k), v] }]
    {a: 1, b: 2}.map { |k, v| [k.to_s, v] }.to_h
    {a: 1, b: 2}.to_h { |k, v| [k.to_s, v] }

    # good
    {a: 1, b: 2}.transform_keys { |k| foo(k) }
    {a: 1, b: 2}.transform_keys { |k| k.to_s }