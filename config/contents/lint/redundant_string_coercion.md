Checks for string conversion in string interpolation, `print`, `puts`, and `warn` arguments,
which is redundant.

### Example:

    # bad

    "result is #{something.to_s}"
    print something.to_s
    puts something.to_s
    warn something.to_s

### Example:

    # good

    "result is #{something}"
    print something
    puts something
    warn something
