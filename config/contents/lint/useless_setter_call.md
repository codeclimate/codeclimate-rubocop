Checks for setter call to local variable as the final
expression of a function definition.

### Safety:

There are edge cases in which the local variable references a
value that is also accessible outside the local scope. This is not
detected by the cop, and it can yield a false positive.

As well, autocorrection is unsafe because the method's
return value will be changed.

### Example:

    # bad
    def something
      x = Something.new
      x.attr = 5
    end

    # good
    def something
      x = Something.new
      x.attr = 5
      x
    end