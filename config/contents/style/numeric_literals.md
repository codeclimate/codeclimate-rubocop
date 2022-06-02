Checks for big numeric literals without _ between groups
of digits in them.

### Example:

    # bad
    1000000
    1_00_000
    1_0000

    # good
    1_000_000
    1000

### Example: Strict: false (default)

    # good
    10_000_00 # typical representation of $10,000 in cents

### Example: Strict: true

    # bad
    10_000_00 # typical representation of $10,000 in cents

### Example: AllowedNumbers: [3000]

    # good
    3000 # You can specify allowed numbers. (e.g. port number)
