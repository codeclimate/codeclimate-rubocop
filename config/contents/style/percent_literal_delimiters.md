Enforces the consistent usage of `%`-literal delimiters.

Specify the 'default' key to set all preferred delimiters at once. You
can continue to specify individual preferred delimiters to override the
default.

### Example:
    # Style/PercentLiteralDelimiters:
    #   PreferredDelimiters:
    #     default: '[]'
    #     '%i':    '()'

    # good
    %w[alpha beta] + %i(gamma delta)

    # bad
    %W(alpha #{beta})

    # bad
    %I(alpha beta)