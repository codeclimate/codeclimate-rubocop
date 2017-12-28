This cop checks for consistent uses of `request.referer` or
`request.referrer`, depending on the cop's configuration.

### Example: EnforcedStyle: referer (default)
    # bad
    request.referrer

    # good
    request.referer

### Example: EnforcedStyle: referrer
    # bad
    request.referer

    # good
    request.referrer