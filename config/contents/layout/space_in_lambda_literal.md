Checks for spaces between `->` and opening parameter
parenthesis (`(`) in lambda literals.

### Example: EnforcedStyle: require_no_space (default)
      # bad
      a = -> (x, y) { x + y }

      # good
      a = ->(x, y) { x + y }

### Example: EnforcedStyle: require_space
      # bad
      a = ->(x, y) { x + y }

      # good
      a = -> (x, y) { x + y }