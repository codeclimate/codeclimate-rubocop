This cop identifies places where `caller[n]`
can be replaced by `caller(n..n).first`.

### Example:
    # bad
    caller[1]
    caller.first
    caller_locations[1]
    caller_locations.first

    # good
    caller(2..2).first
    caller(1..1).first
    caller_locations(2..2).first
    caller_locations(1..1).first