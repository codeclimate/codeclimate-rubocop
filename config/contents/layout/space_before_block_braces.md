Checks that block braces have or don't have a space before the opening
brace depending on configuration.

### Example: EnforcedStyle: space (default)
    # bad
    foo.map{ |a|
      a.bar.to_s
    }

    # good
    foo.map { |a|
      a.bar.to_s
    }

### Example: EnforcedStyle: no_space
    # bad
    foo.map { |a|
      a.bar.to_s
    }

    # good
    foo.map{ |a|
      a.bar.to_s
    }

### Example: EnforcedStyleForEmptyBraces: space (default)
    # bad
    7.times{}

    # good
    7.times {}

### Example: EnforcedStyleForEmptyBraces: no_space
    # bad
    7.times {}

    # good
    7.times{}