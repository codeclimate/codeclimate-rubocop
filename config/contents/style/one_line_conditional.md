TODO: Make configurable.
Checks for uses of if/then/else/end on a single line.

### Example:
    # bad
    if foo then boo else doo end
    unless foo then boo else goo end

    # good
    foo ? boo : doo
    boo if foo
    if foo then boo end

    # good
    if foo
      boo
    else
      doo
    end