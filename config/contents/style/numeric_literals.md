Checks for big numeric literals without `_` between groups
of digits in them.

Additional allowed patterns can be added by adding regexps to
the `AllowedPatterns` configuration. All regexps are treated
as anchored even if the patterns do not contain anchors (so
`\d{4}_\d{4}` will allow `1234_5678` but not `1234_5678_9012`).

NOTE: Even if `AllowedPatterns` are given, autocorrection will
only correct to the standard pattern of an `_` every 3 digits.

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
