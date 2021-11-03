This cop checks for methods with too many parameters.

The maximum number of parameters is configurable.
Keyword arguments can optionally be excluded from the total count,
as they add less complexity than positional or optional parameters.

NOTE: Explicit block argument `&block` is not counted to prevent
        erroneous change that is avoided by making block argument implicit.

### Example: Max: 3
    # good
    def foo(a, b, c = 1)
    end

### Example: Max: 2
    # bad
    def foo(a, b, c = 1)
    end

### Example: CountKeywordArgs: true (default)
    # counts keyword args towards the maximum

    # bad (assuming Max is 3)
    def foo(a, b, c, d: 1)
    end

    # good (assuming Max is 3)
    def foo(a, b, c: 1)
    end

### Example: CountKeywordArgs: false
    # don't count keyword args towards the maximum

    # good (assuming Max is 3)
    def foo(a, b, c, d: 1)
    end

This cop also checks for the maximum number of optional parameters.
This can be configured using the `MaxOptionalParameters` config option.

### Example: MaxOptionalParameters: 3 (default)
    # good
    def foo(a = 1, b = 2, c = 3)
    end

### Example: MaxOptionalParameters: 2
    # bad
    def foo(a = 1, b = 2, c = 3)
    end
