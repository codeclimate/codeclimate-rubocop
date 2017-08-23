This cop identifies places where `caller[n]`
can be replaced by `caller(n..n).first`.

### Example:
    # bad
    caller[n]
    caller.first

    # good
    caller(n..n).first
    caller(1..1).first