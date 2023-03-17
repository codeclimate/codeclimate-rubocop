Enforces or forbids Yoda conditions,
i.e. comparison operations where the order of expression is reversed.
eg. `5 == x`

### Safety:

This cop is unsafe because comparison operators can be defined
differently on different classes, and are not guaranteed to
have the same result if reversed.

For example:

```ruby
class MyKlass
  def ==(other)
    true
  end
end

obj = MyKlass.new
obj == 'string'   #=> true
'string' == obj   #=> false
```

### Example: EnforcedStyle: forbid_for_all_comparison_operators (default)
    # bad
    99 == foo
    "bar" != foo
    42 >= foo
    10 < bar
    99 == CONST

    # good
    foo == 99
    foo == "bar"
    foo <= 42
    bar > 10
    CONST == 99
    "#{interpolation}" == foo
    /#{interpolation}/ == foo

### Example: EnforcedStyle: forbid_for_equality_operators_only
    # bad
    99 == foo
    "bar" != foo

    # good
    99 >= foo
    3 < a && a < 5

### Example: EnforcedStyle: require_for_all_comparison_operators
    # bad
    foo == 99
    foo == "bar"
    foo <= 42
    bar > 10

    # good
    99 == foo
    "bar" != foo
    42 >= foo
    10 < bar

### Example: EnforcedStyle: require_for_equality_operators_only
    # bad
    99 >= foo
    3 < a && a < 5

    # good
    99 == foo
    "bar" != foo