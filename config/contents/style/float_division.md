Checks for division with integers coerced to floats.
It is recommended to either always use `fdiv` or coerce one side only.
This cop also provides other options for code consistency.

### Safety:

This cop is unsafe, because if the operand variable is a string object
then `.to_f` will be removed and an error will occur.

```ruby
a = '1.2'
b = '3.4'
a.to_f / b.to_f # Both `to_f` calls are required here
```

### Example: EnforcedStyle: single_coerce (default)
    # bad
    a.to_f / b.to_f

    # good
    a.to_f / b
    a / b.to_f

### Example: EnforcedStyle: left_coerce
    # bad
    a / b.to_f
    a.to_f / b.to_f

    # good
    a.to_f / b

### Example: EnforcedStyle: right_coerce
    # bad
    a.to_f / b
    a.to_f / b.to_f

    # good
    a / b.to_f

### Example: EnforcedStyle: fdiv
    # bad
    a / b.to_f
    a.to_f / b
    a.to_f / b.to_f

    # good
    a.fdiv(b)