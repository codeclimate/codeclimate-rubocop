Checks for unnecessary additional spaces inside the delimiters of
%i/%w/%x literals.

### Example:
    # good
    %i(foo bar baz)

    # bad
    %w( foo bar baz )

    # bad
    %x(  ls -l )