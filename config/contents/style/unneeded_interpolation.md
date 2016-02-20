This cop checks for strings that are just an interpolated expression.

### Example:

    # bad
    "#{@var}"

    # good
    @var.to_s

    # good if @var is already a String
    @var