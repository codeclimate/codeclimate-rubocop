Checks for accessing the first element of `String#unpack`
which can be replaced with the shorter method `unpack1`.

### Example:

    # bad
    'foo'.unpack('h*').first
    'foo'.unpack('h*')[0]
    'foo'.unpack('h*').slice(0)
    'foo'.unpack('h*').at(0)

    # good
    'foo'.unpack1('h*')
