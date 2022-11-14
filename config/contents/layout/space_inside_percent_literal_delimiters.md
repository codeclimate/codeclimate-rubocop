Checks for unnecessary additional spaces inside the delimiters of
%i/%w/%x literals.

### Example:

    # bad
    %i( foo bar baz )

    # good
    %i(foo bar baz)

    # bad
    %w( foo bar baz )

    # good
    %w(foo bar baz)

    # bad
    %x(  ls -l )

    # good
    %x(ls -l)

    # bad
    %w( )
    %w(
    )

    # good
    %w()