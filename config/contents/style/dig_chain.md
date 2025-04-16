Check for chained `dig` calls that can be collapsed into a single `dig`.

### Safety:

This cop is unsafe because it cannot be guaranteed that the receiver
is an `Enumerable` or does not have a nonstandard implementation
of `dig`.

### Example:
    # bad
    x.dig(:foo).dig(:bar).dig(:baz)
    x.dig(:foo, :bar).dig(:baz)
    x.dig(:foo, :bar)&.dig(:baz)

    # good
    x.dig(:foo, :bar, :baz)

    # good - `dig`s cannot be combined
    x.dig(:foo).bar.dig(:baz)
