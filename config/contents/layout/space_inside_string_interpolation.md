This cop checks for whitespace within string interpolations.

### Example:
    # Good if EnforcedStyle is no_space, bad if space.
       var = "This is the #{no_space} example"

    # Good if EnforceStyle is space, bad if no_space.
       var = "This is the #{ space } example"