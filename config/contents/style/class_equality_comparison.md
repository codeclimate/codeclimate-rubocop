Enforces the use of `Object#instance_of?` instead of class comparison
for equality.

### Example:
    # bad
    var.class == Date
    var.class.equal?(Date)
    var.class.eql?(Date)
    var.class.name == 'Date'

    # good
    var.instance_of?(Date)
