Checks for comparison of something with nil using `==` and
`nil?`.

Supported styles are: predicate, comparison.

### Example: EnforcedStyle: predicate (default)

    # bad
    if x == nil
    end

    # good
    if x.nil?
    end

### Example: EnforcedStyle: comparison

    # bad
    if x.nil?
    end

    # good
    if x == nil
    end
