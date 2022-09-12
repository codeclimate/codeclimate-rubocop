Checks for duplicate ``require``s and ``require_relative``s.

### Safety:

This cop's autocorrection is unsafe because it may break the dependency order
of `require`.

### Example:
    # bad
    require 'foo'
    require 'bar'
    require 'foo'

    # good
    require 'foo'
    require 'bar'

    # good
    require 'foo'
    require_relative 'foo'
