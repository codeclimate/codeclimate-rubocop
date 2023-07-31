Checks for `IO.select` that is incompatible with Fiber Scheduler since Ruby 3.0.

When an array of IO objects waiting for an exception (the third argument of `IO.select`)
is used as an argument, there is no alternative API, so offenses are not registered.

NOTE: When the method is successful the return value of `IO.select` is `[[IO]]`,
and the return value of `io.wait_readable` and `io.wait_writable` are `self`.
They are not autocorrected when assigning a return value because these types are different.
It's up to user how to handle the return value.

### Safety:

This cop's autocorrection is unsafe because `NoMethodError` occurs
if `require 'io/wait'` is not called.

### Example:

    # bad
    IO.select([io], [], [], timeout)

    # good
    io.wait_readable(timeout)

    # bad
    IO.select([], [io], [], timeout)

    # good
    io.wait_writable(timeout)
