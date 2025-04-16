Checks for literals used as the conditions or as
operands in and/or expressions serving as the conditions of
if/while/until/case-when/case-in.

NOTE: Literals in `case-in` condition where the match variable is used in
`in` are accepted as a pattern matching.

### Example:

    # bad
    if 20
      do_something
    end

    # bad
    # We're only interested in the left hand side being a truthy literal,
    # because it affects the evaluation of the &&, whereas the right hand
    # side will be conditionally executed/called and can be a literal.
    if true && some_var
      do_something
    end

    # good
    if some_var
      do_something
    end

    # good
    # When using a boolean value for an infinite loop.
    while true
      break if condition
    end