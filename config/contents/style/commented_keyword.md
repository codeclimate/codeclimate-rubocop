This cop checks for comments put on the same line as some keywords.
These keywords are: `begin`, `class`, `def`, `end`, `module`.

Note that some comments
(`:nodoc:`, `:yields:`, `rubocop:disable` and `rubocop:todo`)
are allowed.

### Example:
    # bad
    if condition
      statement
    end # end if

    # bad
    class X # comment
      statement
    end

    # bad
    def x; end # comment

    # good
    if condition
      statement
    end

    # good
    class X # :nodoc:
      y
    end