Checks whether the block parameters of a single-line
method accepting a block match the names specified via configuration.

For instance one can configure `reduce`(`inject`) to use |a, e| as
parameters.

Configuration option: Methods
Should be set to use this cop. Array of hashes, where each key is the
method name and value - array of argument names.

### Example: Methods: [{reduce: %w[a b]}]
    # bad
    foo.reduce { |c, d| c + d }
    foo.reduce { |_, _d| 1 }

    # good
    foo.reduce { |a, b| a + b }
    foo.reduce { |a, _b| a }
    foo.reduce { |a, (id, _)| a + id }
    foo.reduce { true }

    # good
    foo.reduce do |c, d|
      c + d
    end