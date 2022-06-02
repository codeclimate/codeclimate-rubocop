Checks for `rand(1)` calls.
Such calls always return `0`.

### Example:

    # bad

    rand 1
    Kernel.rand(-1)
    rand 1.0
    rand(-1.0)

### Example:

    # good

    0 # just use 0 instead