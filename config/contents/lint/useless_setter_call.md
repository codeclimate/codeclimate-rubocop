This cop checks for setter call to local variable as the final
expression of a function definition.

### Example:

    # bad

    def something
      x = Something.new
      x.attr = 5
    end

### Example:

    # good

    def something
      x = Something.new
      x.attr = 5
      x
    end