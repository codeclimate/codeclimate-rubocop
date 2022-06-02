Checks for unreachable code.
The check are based on the presence of flow of control
statement in non-final position in `begin` (implicit) blocks.

### Example:

    # bad

    def some_method
      return
      do_something
    end

    # bad

    def some_method
      if cond
        return
      else
        return
      end
      do_something
    end

### Example:

    # good

    def some_method
      do_something
    end