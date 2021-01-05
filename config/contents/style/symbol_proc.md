Use symbols as procs when possible.

### Example:
    # bad
    something.map { |s| s.upcase }
    something.map { _1.upcase }

    # good
    something.map(&:upcase)