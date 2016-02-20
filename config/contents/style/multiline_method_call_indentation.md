This cop checks the indentation of the method name part in method calls
that span more than one line.

### Example:
    # bad
    while a
    .b
      something
    end

    # good, EnforcedStyle: aligned
    while a
          .b
      something
    end

    # good, EnforcedStyle: aligned
    Thing.a
         .b
         .c

    # good, EnforcedStyle: indented
    while a
        .b
      something
    end