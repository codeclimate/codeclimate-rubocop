Checks whether class/module/method definitions are
separated by one or more empty lines.

`NumberOfEmptyLines` can be an integer (default is 1) or
an array (e.g. [1, 2]) to specify a minimum and maximum
number of empty lines permitted.

`AllowAdjacentOneLineDefs` configures whether adjacent
one-line definitions are considered an offense.

### Example: EmptyLineBetweenMethodDefs: true (default)
    # checks for empty lines between method definitions.

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

### Example: EmptyLineBetweenClassDefs: true (default)
    # checks for empty lines between class definitions.

    # bad
    class A
    end
    class B
    end
    def b
    end

### Example:

    # good
    class A
    end

    class B
    end

    def b
    end

### Example: EmptyLineBetweenModuleDefs: true (default)
    # checks for empty lines between module definitions.

    # bad
    module A
    end
    module B
    end
    def b
    end

### Example:

    # good
    module A
    end

    module B
    end

    def b
    end

### Example: AllowAdjacentOneLineDefs: true (default)

    # good
    class ErrorA < BaseError; end
    class ErrorB < BaseError; end
    class ErrorC < BaseError; end

    # good
    class ErrorA < BaseError; end

    class ErrorB < BaseError; end

    class ErrorC < BaseError; end

### Example: AllowAdjacentOneLineDefs: false

    # bad
    class ErrorA < BaseError; end
    class ErrorB < BaseError; end
    class ErrorC < BaseError; end

    # good
    class ErrorA < BaseError; end

    class ErrorB < BaseError; end

    class ErrorC < BaseError; end
