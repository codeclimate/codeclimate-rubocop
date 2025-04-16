Checks for paths given to `require_relative` that start with
the current directory (`./`), which can be omitted.

### Example:

    # bad
    require_relative './path/to/feature'

    # good
    require_relative 'path/to/feature'
