This cop checks for duplicate `require`s and `require_relative`s.

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
