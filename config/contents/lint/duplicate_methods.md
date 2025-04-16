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

    # bad
    def foo
      1
    end

    alias foo bar

    # good
    def foo
      1
    end

    def bar
      2
    end

    # good
    def foo
      1
    end

    alias bar foo