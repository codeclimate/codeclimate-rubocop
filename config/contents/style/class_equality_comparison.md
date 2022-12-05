Enforces the use of `Object#instance_of?` instead of class comparison
for equality.
`==`, `equal?`, and `eql?` methods are ignored by default.
These are customizable with `IgnoredMethods` option.

### Example:
    # bad
    var.class == Date
    var.class.equal?(Date)
    var.class.eql?(Date)
    var.class.name == 'Date'

    # good
    var.instance_of?(Date)

### Example: IgnoreMethods: [] (default)
    # good
    var.instance_of?(Date)

    # bad
    var.class == Date
    var.class.equal?(Date)
    var.class.eql?(Date)
    var.class.name == 'Date'

### Example: IgnoreMethods: [`==`]
    # good
    var.instance_of?(Date)
    var.class == Date
    var.class.name == 'Date'

    # bad
    var.class.equal?(Date)
    var.class.eql?(Date)
