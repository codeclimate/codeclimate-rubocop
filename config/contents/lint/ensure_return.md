Checks for `return` from an `ensure` block.
`return` from an ensure block is a dangerous code smell as it
will take precedence over any exception being raised,
and the exception will be silently thrown away as if it were rescued.

If you want to rescue some (or all) exceptions, best to do it explicitly

### Example:

    # bad

    def foo
      do_something
    ensure
      cleanup
      return self
    end

### Example:

    # good

    def foo
      do_something
      self
    ensure
      cleanup
    end

    # also good

    def foo
      begin
        do_something
      rescue SomeException
        # Let's ignore this exception
      end
      self
    ensure
      cleanup
    end