This cops checks the indentation of hanging closing parentheses in
method calls, method definitions, and grouped expressions. A hanging
closing parenthesis means `)` preceded by a line break.

### Example:

    # good: when x is on its own line, indent this way
    func(
      x,
      y
    )

    # good: when x follows opening parenthesis, align parentheses
    a = b * (x +
             y
            )

    # bad
    def func(
      x,
      y
      )