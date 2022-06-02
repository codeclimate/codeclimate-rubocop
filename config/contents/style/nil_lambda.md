Checks for lambdas and procs that always return nil,
which can be replaced with an empty lambda or proc instead.

### Example:
    # bad
    -> { nil }

    lambda do
      next nil
    end

    proc { nil }

    Proc.new do
      break nil
    end

    # good
    -> {}

    lambda do
    end

    -> (x) { nil if x }

    proc {}

    Proc.new { nil if x }
