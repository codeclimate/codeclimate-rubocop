This cop checks for lambdas that always return nil, which can be replaced
with an empty lambda instead.

### Example:
    # bad
    -> { nil }

    lambda do
      next nil
    end

    # good
    -> {}

    lambda do
    end

    -> (x) { nil if x }
