This cop checks for redundant `if` with boolean literal branches.
It checks only conditions to return boolean value (`true` or `false`) for safe detection.
The conditions to be checked are comparison methods, predicate methods, and double negative.
However, auto-correction is unsafe because there is no guarantee that all predicate methods
will return boolean value. Those methods can be allowed with `AllowedMethods` config.

### Example:
    # bad
    if foo == bar
      true
    else
      false
    end

    # bad
    foo == bar ? true : false

    # good
    foo == bar

### Example: AllowedMethods: ['nonzero?']
    # good
    num.nonzero? ? true : false
