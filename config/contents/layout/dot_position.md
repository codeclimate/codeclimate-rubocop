Checks the . position in multi-line method calls.

### Example: EnforcedStyle: leading (default)
    # bad
    something.
      method

    # good
    something
      .method

### Example: EnforcedStyle: trailing
    # bad
    something
      .method

    # good
    something.
      method