This cop checks for a redundant argument passed to certain methods.

Limitations:

1. This cop matches for method names only and hence cannot tell apart
     methods with same name in different classes.
2. This cop is limited to methods with single parameter.
3. This cop is unsafe if certain special global variables (e.g. `$;`, `$/`) are set.
     That depends on the nature of the target methods, of course.

Method names and their redundant arguments can be configured like this:

Methods:
    join: ''
    split: ' '
    chomp: "\n"
    chomp!: "\n"
    foo: 2

### Example:
    # bad
    array.join('')
    [1, 2, 3].join("")
    string.split(" ")
    "first\nsecond".split(" ")
    string.chomp("\n")
    string.chomp!("\n")
    A.foo(2)

    # good
    array.join
    [1, 2, 3].join
    string.split
    "first second".split
    string.chomp
    string.chomp!
    A.foo