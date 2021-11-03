This cop checks for `:true` and `:false` symbols.
In most cases it would be a typo.

### Safety:

Autocorrection is unsafe for this cop because code relying
on `:true` or `:false` symbols will break when those are
changed to actual booleans.

### Example:

    # bad
    :true

    # good
    true

### Example:

    # bad
    :false

    # good
    false