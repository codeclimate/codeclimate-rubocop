Checks that block braces have or don't have surrounding space inside
them on configuration. For blocks taking parameters, it checks that the
left brace has or doesn't have trailing space depending on
configuration.

### Example: EnforcedStyle: space (default)
    # The `space` style enforces that block braces have
    # surrounding space.

    # bad
    some_array.each {puts e}

    # good
    some_array.each { puts e }

### Example: EnforcedStyle: no_space
    # The `no_space` style enforces that block braces don't
    # have surrounding space.

    # bad
    some_array.each { puts e }

    # good
    some_array.each {puts e}


### Example: EnforcedStyleForEmptyBraces: no_space (default)
    # The `no_space` EnforcedStyleForEmptyBraces style enforces that
    # block braces don't have a space in between when empty.

    # bad
    some_array.each {   }
    some_array.each {  }
    some_array.each { }

    # good
    some_array.each {}

### Example: EnforcedStyleForEmptyBraces: space
    # The `space` EnforcedStyleForEmptyBraces style enforces that
    # block braces have at least a spece in between when empty.

    # bad
    some_array.each {}

    # good
    some_array.each { }
    some_array.each {  }
    some_array.each {   }


### Example: SpaceBeforeBlockParameters: true (default)
    # The SpaceBeforeBlockParameters style set to `true` enforces that
    # there is a space between `{` and `|`. Overrides `EnforcedStyle`
    # if there is a conflict.

    # bad
    [1, 2, 3].each {|n| n * 2 }

    # good
    [1, 2, 3].each { |n| n * 2 }

### Example: SpaceBeforeBlockParameters: true
    # The SpaceBeforeBlockParameters style set to `false` enforces that
    # there is no space between `{` and `|`. Overrides `EnforcedStyle`
    # if there is a conflict.

    # bad
    [1, 2, 3].each { |n| n * 2 }

    # good
    [1, 2, 3].each {|n| n * 2 }
