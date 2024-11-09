Checks the args passed to `fail` and `raise`.

Exploded style (default) enforces passing the exception class and message
arguments separately, rather than constructing an instance of the error.

Compact style enforces constructing an error instance.

Both styles allow passing just a message, or an error instance when there is more
than one argument.

The exploded style has an `AllowedCompactTypes` configuration
option that takes an `Array` of exception name Strings.

### Safety:

This cop is unsafe because `raise Foo` calls `Foo.exception`, not `Foo.new`.

### Example: EnforcedStyle: exploded (default)
    # bad
    raise StandardError.new('message')

    # good
    raise StandardError, 'message'
    fail 'message'
    raise MyCustomError
    raise MyCustomError.new(arg1, arg2, arg3)
    raise MyKwArgError.new(key1: val1, key2: val2)

    # With `AllowedCompactTypes` set to ['MyWrappedError']
    raise MyWrappedError.new(obj)
    raise MyWrappedError.new(obj), 'message'

### Example: EnforcedStyle: compact
    # bad
    raise StandardError, 'message'
    raise RuntimeError, arg1, arg2, arg3

    # good
    raise StandardError.new('message')
    raise MyCustomError
    raise MyCustomError.new(arg1, arg2, arg3)
    fail 'message'