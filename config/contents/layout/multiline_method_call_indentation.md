This cop checks the indentation of the method name part in method calls
that span more than one line.

### Example:
    # bad
    while myvariable
    .b
      # do something
    end

    # good, EnforcedStyle: aligned
    while myvariable
          .b
      # do something
    end

    # good, EnforcedStyle: aligned
    Thing.a
         .b
         .c

    # good, EnforcedStyle:    indented,
            IndentationWidth: 2
    while myvariable
      .b

      # do something
    end

    # good, EnforcedStyle:    indented_relative_to_receiver,
            IndentationWidth: 2
    while myvariable
            .a
            .b

      # do something
    end

    # good, EnforcedStyle:    indented_relative_to_receiver,
            IndentationWidth: 2
    myvariable = Thing
                   .a
                   .b
                   .c