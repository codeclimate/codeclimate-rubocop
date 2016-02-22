Use symbols as procs when possible.

### Example:
    # bad
    something.map { |s| s.upcase }

    # good
    something.map(&:upcase)