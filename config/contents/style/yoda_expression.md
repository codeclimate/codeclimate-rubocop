Forbids Yoda expressions, i.e. binary operations (using `*`, `+`, `&`, `|`,
and `^` operators) where the order of expression is reversed, eg. `1 + x`.
This cop complements `Style/YodaCondition` cop, which has a similar purpose.

This cop is disabled by default to respect user intentions such as:

```ruby
config.server_port = 9000 + ENV["TEST_ENV_NUMBER"].to_i
```

### Safety:

This cop is unsafe because binary operators can be defined
differently on different classes, and are not guaranteed to
have the same result if reversed.

### Example: SupportedOperators: ['*', '+', '&'']
    # bad
    1 + x
    10 * y
    1 & z
    1 + CONST

    # good
    60 * 24
    x + 1
    y * 10
    z & 1
    CONST + 1

    # good
    1 | x
