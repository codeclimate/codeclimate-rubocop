Checks that the indentation method is consistent.
Either tabs only or spaces only are used for indentation.

### Example: EnforcedStyle: spaces (default)
    # bad
    # This example uses a tab to indent bar.
    def foo
      bar
    end

    # good
    # This example uses spaces to indent bar.
    def foo
      bar
    end

### Example: EnforcedStyle: tabs
    # bad
    # This example uses spaces to indent bar.
    def foo
      bar
    end

    # good
    # This example uses a tab to indent bar.
    def foo
      bar
    end