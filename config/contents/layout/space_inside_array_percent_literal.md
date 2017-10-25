Checks for unnecessary additional spaces inside array percent literals
(i.e. %i/%w).

### Example:
    # good
    %i(foo bar baz)

    # bad
    %w(foo  bar  baz)