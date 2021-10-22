This cop checks for places where string concatenation
can be replaced with string interpolation.

The cop can autocorrect simple cases but will skip autocorrecting
more complex cases where the resulting code would be harder to read.
In those cases, it might be useful to extract statements to local
variables or methods which you can then interpolate in a string.

NOTE: When concatenation between two strings is broken over multiple
lines, this cop does not register an offense; instead,
`Style/LineEndConcatenation` will pick up the offense if enabled.

Two modes are supported:
1. `aggressive` style checks and corrects all occurrences of `+` where
either the left or right side of `+` is a string literal.
2. `conservative` style on the other hand, checks and corrects only if
left side (receiver of `+` method call) is a string literal.
This is useful when the receiver is some expression that returns string like `Pathname`
instead of a string literal.

### Safety:

This cop is unsafe in `aggressive` mode, as it cannot be guaranteed that
the receiver is actually a string, which can result in a false positive.

### Example: Mode: aggressive (default)
    # bad
    email_with_name = user.name + ' <' + user.email + '>'
    Pathname.new('/') + 'test'

    # good
    email_with_name = "#{user.name} <#{user.email}>"
    email_with_name = format('%s <%s>', user.name, user.email)
    "#{Pathname.new('/')}test"

    # accepted, line-end concatenation
    name = 'First' +
      'Last'

### Example: Mode: conservative
    # bad
    'Hello' + user.name

    # good
    "Hello #{user.name}"
    user.name + '!!'
    Pathname.new('/') + 'test'
