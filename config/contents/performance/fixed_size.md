Do not compute the size of statically sized objects.

### Example:
    # String methods
    # bad
    'foo'.size
    %q[bar].count
    %(qux).length

    # Symbol methods
    # bad
    :fred.size
    :'baz'.length

    # Array methods
    # bad
    [1, 2, thud].count
    %W(1, 2, bar).size

    # Hash methods
    # bad
    { a: corge, b: grault }.length

    # good
    foo.size
    bar.count
    qux.length

    # good
    :"#{fred}".size
    CONST = :baz.length

    # good
    [1, 2, *thud].count
    garply = [1, 2, 3]
    garly.size

    # good
    { a: corge, **grault }.length
    waldo = { a: corge, b: grault }
    waldo.size
