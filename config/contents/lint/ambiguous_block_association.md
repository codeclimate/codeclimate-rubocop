Checks for ambiguous block association with method
when param passed without parentheses.

This cop can customize ignored methods with `IgnoredMethods`.
By default, there are no methods to ignored.

### Example:

    # bad
    some_method a { |val| puts val }

### Example:

    # good
    # With parentheses, there's no ambiguity.
    some_method(a { |val| puts val })
    # or (different meaning)
    some_method(a) { |val| puts val }

    # good
    # Operator methods require no disambiguation
    foo == bar { |b| b.baz }

    # good
    # Lambda arguments require no disambiguation
    foo = ->(bar) { bar.baz }

### Example: IgnoredMethods: [] (default)

    # bad
    expect { do_something }.to change { object.attribute }

### Example: IgnoredMethods: [change]

    # good
    expect { do_something }.to change { object.attribute }
