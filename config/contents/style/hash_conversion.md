Checks the usage of pre-2.1 `Hash[args]` method of converting enumerables and
sequences of values to hashes.

Correction code from splat argument (`Hash[*ary]`) is not simply determined. For example,
`Hash[*ary]` can be replaced with `ary.each_slice(2).to_h` but it will be complicated.
So, `AllowSplatArgument` option is true by default to allow splat argument for simple code.

### Safety:

This cop's autocorrection is unsafe because `ArgumentError` occurs
if the number of elements is odd:

```ruby
Hash[[[1, 2], [3]]] #=> {1=>2, 3=>nil}
[[1, 2], [5]].to_h  #=> wrong array length at 1 (expected 2, was 1) (ArgumentError)
```

### Example:
    # bad
    Hash[ary]

    # good
    ary.to_h

    # bad
    Hash[key1, value1, key2, value2]

    # good
    {key1 => value1, key2 => value2}

### Example: AllowSplatArgument: true (default)
    # good
    Hash[*ary]

### Example: AllowSplatArgument: false
    # bad
    Hash[*ary]
