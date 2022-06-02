Enforces consistent use of `Object#is_a?` or `Object#kind_of?`.

### Example: EnforcedStyle: is_a? (default)
    # bad
    var.kind_of?(Date)
    var.kind_of?(Integer)

    # good
    var.is_a?(Date)
    var.is_a?(Integer)

### Example: EnforcedStyle: kind_of?
    # bad
    var.is_a?(Time)
    var.is_a?(String)

    # good
    var.kind_of?(Time)
    var.kind_of?(String)
