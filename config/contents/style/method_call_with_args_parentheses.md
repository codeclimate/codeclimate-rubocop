This cop checks presence of parentheses in method calls containing
parameters.
As in popular Ruby's frameworks a lot of methods should always be
called without parentheses,
users can ignore them by passing their names to IgnoredMethods option.

### Example:
    # bad
    array.delete e

    # good
    array.delete(e)

    # good if `puts` is listed in IgnoredMethods
    puts 'test'