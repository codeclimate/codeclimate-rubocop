Makes sure that certain binary operator methods have their
sole  parameter named `other`.

### Example:

    # bad
    def +(amount); end

    # good
    def +(other); end