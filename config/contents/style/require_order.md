Sort `require` and `require_relative` in alphabetical order.

### Safety:

This cop's autocorrection is unsafe because it will obviously change the execution order.

### Example:
    # bad
    require 'b'
    require 'a'

    # good
    require 'a'
    require 'b'

    # bad
    require_relative 'b'
    require_relative 'a'

    # good
    require_relative 'a'
    require_relative 'b'

    # good (sorted within each section separated by a blank line)
    require 'a'
    require 'd'

    require 'b'
    require 'c'

    # good
    require 'b'
    require_relative 'c'
    require 'a'

    # bad
    require 'a'
    require 'c' if foo
    require 'b'

    # good
    require 'a'
    require 'b'
    require 'c' if foo

    # bad
    require 'c'
    if foo
      require 'd'
      require 'b'
    end
    require 'a'

    # good
    require 'c'
    if foo
      require 'b'
      require 'd'
    end
    require 'a'
