Checks that arrays are not sliced with the redundant `ary[0..-1]`, replacing it with `ary`,
and ensures arrays are sliced with endless ranges instead of `ary[start..-1]` on Ruby 2.6+,
and with beginless ranges instead of `ary[nil..end]` on Ruby 2.7+.

### Safety:

This cop is unsafe because `x..-1` and `x..` are only guaranteed to
be equivalent for `Array#[]`, `String#[]`, and the cop cannot determine what class
the receiver is.

For example:
```ruby
sum = proc { |ary| ary.sum }
sum[-3..-1] # => -6
sum[-3..] # Hangs forever
```

### Example:
    # bad
    items[0..-1]
    items[0..nil]
    items[0...nil]

    # good
    items

    # bad
    items[1..-1]   # Ruby 2.6+
    items[1..nil]  # Ruby 2.6+

    # good
    items[1..]     # Ruby 2.6+

    # bad
    items[nil..42] # Ruby 2.7+

    # good
    items[..42]    # Ruby 2.7+
    items[0..42]   # Ruby 2.7+
