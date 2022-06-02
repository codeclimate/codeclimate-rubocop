Checks for string literal concatenation at
the end of a line.

### Safety:

This cop is unsafe because it cannot be guaranteed that the
receiver is a string, in which case replacing `<<` with `\`
would result in a syntax error.

For example, this would be a false positive:
```ruby
array << 'foo' <<
         'bar' <<
         'baz'
```

### Example:

    # bad
    some_str = 'ala' +
               'bala'

    some_str = 'ala' <<
               'bala'

    # good
    some_str = 'ala' \
               'bala'
