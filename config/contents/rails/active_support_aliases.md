This cop checks that ActiveSupport aliases to core ruby methods
are not used.

### Example:
    # good
    'some_string'.start_with?('prefix')
    'some_string'.end_with?('suffix')
    [1, 2, 'a'] << 'b'
    [1, 2, 'a'].unshift('b')

    # bad
    'some_string'.starts_with?('prefix')
    'some_string'.ends_with?('suffix')
    [1, 2, 'a'].append('b')
    [1, 2, 'a'].prepend('b')
