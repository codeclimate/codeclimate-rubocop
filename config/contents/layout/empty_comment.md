Checks empty comment.

### Example:
    # bad

    #
    class Foo
    end

    # good

    #
    # Description of `Foo` class.
    #
    class Foo
    end

### Example: AllowBorderComment: true (default)
    # good

    def foo
    end

    #################

    def bar
    end

### Example: AllowBorderComment: false
    # bad

    def foo
    end

    #################

    def bar
    end

### Example: AllowMarginComment: true (default)
    # good

    #
    # Description of `Foo` class.
    #
    class Foo
    end

### Example: AllowMarginComment: false
    # bad

    #
    # Description of `Foo` class.
    #
    class Foo
    end
