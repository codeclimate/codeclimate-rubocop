This cop checks the . position in multi-line method calls.

### Example: EnforcedStyle: leading (default)
    # bad
    something.
      mehod

    # good
    something
      .method

### Example: EnforcedStyle: trailing
    # bad
    something
      .method

    # good
    something.
      mehod