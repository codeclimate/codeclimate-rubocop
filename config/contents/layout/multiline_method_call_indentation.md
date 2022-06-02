Checks the indentation of the method name part in method calls
that span more than one line.

### Example: EnforcedStyle: aligned (default)
    # bad
    while myvariable
    .b
      # do something
    end

    # good
    while myvariable
          .b
      # do something
    end

    # good
    Thing.a
         .b
         .c

### Example: EnforcedStyle: indented
    # good
    while myvariable
      .b

      # do something
    end

### Example: EnforcedStyle: indented_relative_to_receiver
    # good
    while myvariable
            .a
            .b

      # do something
    end

    # good
    myvariable = Thing
                   .a
                   .b
                   .c