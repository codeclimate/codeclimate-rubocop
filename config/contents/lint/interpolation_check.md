This cop checks for interpolation in a single quoted string.

### Safety:

This cop is generally safe, but is marked as unsafe because
it is possible to actually intentionally have text inside
`#{...}` in a single quoted string.

### Example:

    # bad

    foo = 'something with #{interpolation} inside'

### Example:

    # good

    foo = "something with #{interpolation} inside"