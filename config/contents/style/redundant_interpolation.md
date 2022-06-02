Checks for strings that are just an interpolated expression.

### Safety:

Autocorrection is unsafe because when calling a destructive method to string,
the resulting string may have different behavior or raise `FrozenError`.

```ruby
x = 'a'
y = "#{x}"
y << 'b'   # return 'ab'
x          # return 'a'
y = x.to_s
y << 'b'   # return 'ab'
x          # return 'ab'

x = 'a'.freeze
y = "#{x}"
y << 'b'   # return 'ab'.
y = x.to_s
y << 'b'   # raise `FrozenError`.
```

### Example:

    # bad
    "#{@var}"

    # good
    @var.to_s

    # good if @var is already a String
    @var