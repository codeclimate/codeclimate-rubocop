Checks for uses of if/then/else/end constructs on a single line.
AlwaysCorrectToMultiline config option can be set to true to auto-convert all offenses to
multi-line constructs. When AlwaysCorrectToMultiline is false (default case) the
autocorrect will first try converting them to ternary operators.

### Example:
    # bad
    if foo then bar else baz end

    # bad
    unless foo then baz else bar end

    # good
    foo ? bar : baz

    # good
    bar if foo

    # good
    if foo then bar end

    # good
    if foo
      bar
    else
      baz
    end