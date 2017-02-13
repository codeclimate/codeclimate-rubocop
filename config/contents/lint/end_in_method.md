This cop checks for END blocks in method definitions.

### Example:

    # bad

    def some_method
      END { do_something }
    end

### Example:

    # good

    def some_method
      at_exit { do_something }
    end

### Example:

    # good

    # outside defs
    END { do_something }