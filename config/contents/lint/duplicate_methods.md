Checks for duplicated instance (or singleton) method
definitions.

### Example:

    # bad

    def foo
      1
    end

    def foo
      2
    end

### Example:

    # bad

    def foo
      1
    end

    alias foo bar

### Example:

    # good

    def foo
      1
    end

    def bar
      2
    end

### Example:

    # good

    def foo
      1
    end

    alias bar foo