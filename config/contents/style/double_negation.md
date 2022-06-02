Checks for uses of double negation (`!!`) to convert something to a boolean value.

When using `EnforcedStyle: allowed_in_returns`, allow double negation in contexts
that use boolean as a return value. When using `EnforcedStyle: forbidden`, double negation
should be forbidden always.

NOTE: when `something` is a boolean value
`!!something` and `!something.nil?` are not the same thing.
As you're unlikely to write code that can accept values of any type
this is rarely a problem in practice.

### Safety:

Autocorrection is unsafe when the value is `false`, because the result
of the expression will change.

```ruby
!!false     #=> false
!false.nil? #=> true
```

### Example:
    # bad
    !!something

    # good
    !something.nil?

### Example: EnforcedStyle: allowed_in_returns (default)
    # good
    def foo?
      !!return_value
    end

    define_method :foo? do
      !!return_value
    end

    define_singleton_method :foo? do
      !!return_value
    end

### Example: EnforcedStyle: forbidden
    # bad
    def foo?
      !!return_value
    end

    define_method :foo? do
      !!return_value
    end

    define_singleton_method :foo? do
      !!return_value
    end