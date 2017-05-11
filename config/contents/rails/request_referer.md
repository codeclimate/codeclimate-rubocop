This cop checks for consistent uses of `request.referer` or
`request.referrer`, depending on the cop's configuration.

### Example:
    # EnforcedStyle: referer
    # bad
    request.referrer

    # good
    request.referer

    # EnforcedStyle: referrer
    # bad
    request.referer

    # good
    request.referrer