This cop checks that arrays are sliced with endless ranges instead of
`ary[start..-1]` on Ruby 2.6+.

### Safety:

This cop is unsafe because `x..-1` and `x..` are only guaranteed to
be equivalent for `Array#[]`, and the cop cannot determine what class
the receiver is.

For example:
```ruby
sum = proc { |ary| ary.sum }
sum[-3..-1] # => -6
sum[-3..] # Hangs forever
```

### Example:
    # bad
    items[1..-1]

    # good
    items[1..]