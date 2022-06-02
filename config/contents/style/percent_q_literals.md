Checks for usage of the %Q() syntax when %q() would do.

### Example: EnforcedStyle: lower_case_q (default)
    # The `lower_case_q` style prefers `%q` unless
    # interpolation is needed.
    # bad
    %Q[Mix the foo into the baz.]
    %Q(They all said: 'Hooray!')

    # good
    %q[Mix the foo into the baz]
    %q(They all said: 'Hooray!')

### Example: EnforcedStyle: upper_case_q
    # The `upper_case_q` style requires the sole use of `%Q`.
    # bad
    %q/Mix the foo into the baz./
    %q{They all said: 'Hooray!'}

    # good
    %Q/Mix the foo into the baz./
    %Q{They all said: 'Hooray!'}