Checks for uses a redundant current directory in path.

### Example:

    # bad
    require_relative './path/to/feature'

    # good
    require_relative 'path/to/feature'
