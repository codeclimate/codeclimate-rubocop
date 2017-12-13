This cop checks for uses of "*" as a substitute for *join*.

Not all cases can reliably checked, due to Ruby's dynamic
types, so we consider only cases when the first argument is an
array literal or the second is a string literal.

### Example:

    # bad
    %w(foo bar baz) * ","

    # good
    %w(foo bar bax).join(",")
