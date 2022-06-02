Checks for parentheses for empty lambda parameters. Parentheses
for empty lambda parameters do not cause syntax errors, but they are
redundant.

### Example:
    # bad
    -> () { do_something }

    # good
    -> { do_something }

    # good
    -> (arg) { do_something(arg) }