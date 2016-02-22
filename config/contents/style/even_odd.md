This cop checks for places where Fixnum#even? or Fixnum#odd?
should have been used.

### Example:

    # bad
    if x % 2 == 0

    # good
    if x.even?