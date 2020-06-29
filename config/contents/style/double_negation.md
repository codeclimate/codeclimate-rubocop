This cop checks for uses of double negation (`!!`) to convert something to a boolean value.

When using `EnforcedStyle: allowed_in_returns`, allow double nagation in contexts
that use boolean as a return value. When using `EnforcedStyle: forbidden`, double nagation
should be forbidden always.

### Example:

    # bad
    !!something

    # good
    !something.nil?

### Example: EnforcedStyle: forbidden
    # bad
    def foo?
      !!return_value
    end

Please, note that when something is a boolean value
!!something and !something.nil? are not the same thing.
As you're unlikely to write code that can accept values of any type
this is rarely a problem in practice.
