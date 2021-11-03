Checks for uses a file requiring itself with `require_relative`.

### Example:

    # bad

    # foo.rb
    require_relative 'foo'
    require_relative 'bar'

    # good

    # foo.rb
    require_relative 'bar'
