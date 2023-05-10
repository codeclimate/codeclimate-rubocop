Enforces the use of `max` or `min` instead of comparison for greater or less.

NOTE: It can be used if you want to present limit or threshold in Ruby 2.7+.
That it is slow though. So autocorrection will apply generic `max` or `min`:

```ruby
a.clamp(b..) # Same as `[a, b].max`
a.clamp(..b) # Same as `[a, b].min`
```

### Safety:

This cop is unsafe because even if a value has `<` or `>` method,
it is not necessarily `Comparable`.

### Example:

    # bad
    a > b ? a : b
    a >= b ? a : b

    # good
    [a, b].max

    # bad
    a < b ? a : b
    a <= b ? a : b

    # good
    [a, b].min
