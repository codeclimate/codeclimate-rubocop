Enforces the use of `Object#instance_of?` instead of class comparison
for equality.
`==`, `equal?`, and `eql?` methods are allowed by default.
These are customizable with `AllowedMethods` option.

### Example:
    # bad
    var.class == Date
    var.class.equal?(Date)
    var.class.eql?(Date)
    var.class.name == 'Date'

    # good
    var.instance_of?(Date)

### Example: AllowedMethods: [] (default)
    # good
    var.instance_of?(Date)

    # bad
    var.class == Date
    var.class.equal?(Date)
    var.class.eql?(Date)
    var.class.name == 'Date'

### Example: AllowedMethods: [`==`]
    # good
    var.instance_of?(Date)
    var.class == Date
    var.class.name == 'Date'

    # bad
    var.class.equal?(Date)
    var.class.eql?(Date)

### Example: AllowedPatterns: [] (default)
    # good
    var.instance_of?(Date)

    # bad
    var.class == Date
    var.class.equal?(Date)
    var.class.eql?(Date)
    var.class.name == 'Date'

### Example: AllowedPatterns: ['eq']
    # good
    var.instance_of?(Date)
    var.class.equal?(Date)
    var.class.eql?(Date)

    # bad
    var.class == Date
    var.class.name == 'Date'
