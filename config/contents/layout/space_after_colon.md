Checks for colon (`:`) not followed by some kind of space.
N.B. this cop does not handle spaces after a ternary operator, which are
instead handled by `Layout/SpaceAroundOperators`.

### Example:
    # bad
    def f(a:, b:2); {a:3}; end

    # good
    def f(a:, b: 2); {a: 3}; end