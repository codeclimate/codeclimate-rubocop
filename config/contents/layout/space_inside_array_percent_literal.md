Checks for unnecessary additional spaces inside array percent literals
(i.e. %i/%w).

### Example:

    # bad
    %w(foo  bar  baz)
    # good
    %i(foo bar baz)