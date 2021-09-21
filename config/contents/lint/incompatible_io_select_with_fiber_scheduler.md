
This cop checks for `IO.select` that is incompatible with Fiber Scheduler since Ruby 3.0.

### Example:

    # bad
    IO.select([io], [], [], timeout)

    # good
    io.wait_readable(timeout)

    # bad
    IO.select([], [io], [], timeout)

    # good
    io.wait_writable(timeout)
