This cop checks for string literal concatenation at
the end of a line.

### Example:

    # bad
    some_str = 'ala' +
               'bala'

    some_str = 'ala' <<
               'bala'

    # good
    some_str = 'ala' \
               'bala'
