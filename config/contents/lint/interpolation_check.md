This cop checks for interpolation in a single quoted string.

### Example:

    # bad

    foo = 'something with #{interpolation} inside'

### Example:

    # good

    foo = "something with #{interpolation} inside"