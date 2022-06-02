Checks for whitespace within string interpolations.

### Example: EnforcedStyle: no_space (default)
    # bad
       var = "This is the #{ space } example"

    # good
       var = "This is the #{no_space} example"

### Example: EnforcedStyle: space
    # bad
       var = "This is the #{no_space} example"

    # good
       var = "This is the #{ space } example"