Checks for redundant dot before operator method call.
The target operator methods are `|`, `^`, `&`, ``<=>``, `==`, `===`, `=~`, `>`, `>=`, `<`,
``<=``, `<<`, `>>`, `+`, `-`, `*`, `/`, `%`, `**`, `~`, `!`, `!=`, and `!~`.

### Example:

    # bad
    foo.+ bar
    foo.& bar

    # good
    foo + bar
    foo & bar
