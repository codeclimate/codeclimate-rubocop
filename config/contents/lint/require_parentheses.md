Checks for expressions where there is a call to a predicate
method with at least one argument, where no parentheses are used around
the parameter list, and a boolean operator, && or ||, is used in the
last argument.

The idea behind warning for these constructs is that the user might
be under the impression that the return value from the method call is
an operand of &&/||.

### Example:

    # bad

    if day.is? :tuesday && month == :jan
      # ...
    end

### Example:

    # good

    if day.is?(:tuesday) && month == :jan
      # ...
    end