Checks for uses of unless with a negated condition. Only unless
without else are considered. There are three different styles:

    - both
    - prefix
    - postfix

### Example: EnforcedStyle: both (default)
    # enforces `if` for `prefix` and `postfix` conditionals

    # bad
    unless !foo
      bar
    end

    # good
    if foo
      bar
    end

    # bad
    bar unless !foo

    # good
    bar if foo

### Example: EnforcedStyle: prefix
    # enforces `if` for just `prefix` conditionals

    # bad
    unless !foo
      bar
    end

    # good
    if foo
      bar
    end

    # good
    bar unless !foo

### Example: EnforcedStyle: postfix
    # enforces `if` for just `postfix` conditionals

    # bad
    bar unless !foo

    # good
    bar if foo

    # good
    unless !foo
      bar
    end