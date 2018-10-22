This cop checks whether method definitions are
separated by one empty line.

`NumberOfEmptyLines` can be an integer (default is 1) or
an array (e.g. [1, 2]) to specify a minimum and maximum
number of empty lines permitted.

`AllowAdjacentOneLineDefs` configures whether adjacent
one-line method definitions are considered an offense.

### Example:

    # bad
    def a
    end
    def b
    end

### Example:

    # good
    def a
    end

    def b
    end