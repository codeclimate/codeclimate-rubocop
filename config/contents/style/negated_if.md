Checks for uses of if with a negated condition. Only ifs
without else are considered. There are three different styles:

    - both
    - prefix
    - postfix

### Example:

    # EnforcedStyle: both
    # enforces `unless` for `prefix` and `postfix` conditionals

    # good

    unless foo
      bar
    end

    # bad

    if !foo
      bar
    end

    # good

    bar unless foo

    # bad

    bar if !foo

### Example:

    # EnforcedStyle: prefix
    # enforces `unless` for just `prefix` conditionals

    # good

    unless foo
      bar
    end

    # bad

    if !foo
      bar
    end

    # good

    bar if !foo

### Example:

    # EnforcedStyle: postfix
    # enforces `unless` for just `postfix` conditionals

    # good

    bar unless foo

    # bad

    bar if !foo

    # good

    if !foo
      bar
    end