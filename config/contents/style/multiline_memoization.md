Checks expressions wrapping styles for multiline memoization.

### Example: EnforcedStyle: keyword (default)
    # bad
    foo ||= (
      bar
      baz
    )

    # good
    foo ||= begin
      bar
      baz
    end

### Example: EnforcedStyle: braces
    # bad
    foo ||= begin
      bar
      baz
    end

    # good
    foo ||= (
      bar
      baz
    )