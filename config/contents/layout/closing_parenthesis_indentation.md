Checks the indentation of hanging closing parentheses in
method calls, method definitions, and grouped expressions. A hanging
closing parenthesis means `)` preceded by a line break.

### Example:

    # bad
    some_method(
      a,
      b
      )

    some_method(
      a, b
      )

    some_method(a, b, c
      )

    some_method(a,
                b,
                c
      )

    some_method(a,
      x: 1,
      y: 2
      )

    # Scenario 1: When First Parameter Is On Its Own Line

    # good: when first param is on a new line, right paren is *always*
    #       outdented by IndentationWidth
    some_method(
      a,
      b
    )

    # good
    some_method(
      a, b
    )

    # Scenario 2: When First Parameter Is On The Same Line

    # good: when all other params are also on the same line, outdent
    #       right paren by IndentationWidth
    some_method(a, b, c
               )

    # good: when all other params are on multiple lines, but are lined
    #       up, align right paren with left paren
    some_method(a,
                b,
                c
               )

    # good: when other params are not lined up on multiple lines, outdent
    #       right paren by IndentationWidth
    some_method(a,
      x: 1,
      y: 2
    )

