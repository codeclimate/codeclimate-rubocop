This cop enforces using // or %r around regular expressions.

### Example:
    # Good if EnforcedStyle is slashes or mixed, bad if percent_r.
    snake_case = /^[\dA-Z_]+$/

    # Good if EnforcedStyle is percent_r, bad if slashes or mixed.
    snake_case = %r{^[\dA-Z_]+$}

    # Good if EnforcedStyle is slashes, bad if percent_r or mixed.
    regex = /
      foo
      (bar)
      (baz)
    /x

    # Good if EnforcedStyle is percent_r or mixed, bad if slashes.
    regex = %r{
      foo
      (bar)
      (baz)
    }x

    # Bad unless AllowInnerSlashes is true.
    x =~ /home\//