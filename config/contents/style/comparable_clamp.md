Enforces the use of `Comparable#clamp` instead of comparison by minimum and maximum.

This cop supports autocorrection for `if/elsif/else` bad style only.
Because `ArgumentError` occurs if the minimum and maximum of `clamp` arguments are reversed.
When these are variables, it is not possible to determine which is the minimum and maximum:

```ruby
[1, [2, 3].max].min # => 1
1.clamp(3, 1)       # => min argument must be smaller than max argument (ArgumentError)
```

### Example:

    # bad
    [[x, low].max, high].min

    # bad
    if x < low
      low
    elsif high < x
      high
    else
      x
    end

    # good
    x.clamp(low, high)
