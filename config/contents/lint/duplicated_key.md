This cop checks for duplicated keys in hash literals.

This cop mirrors a warning in Ruby 2.2.

### Example:

    # bad

    hash = { food: 'apple', food: 'orange' }

### Example:

    # good

    hash = { food: 'apple', other_food: 'orange' }