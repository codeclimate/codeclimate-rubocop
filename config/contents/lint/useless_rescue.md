Checks for useless `rescue`s, which only reraise rescued exceptions.

### Example:
    # bad
    def foo
      do_something
    rescue
      raise
    end

    # bad
    def foo
      do_something
    rescue => e
      raise # or 'raise e', or 'raise $!', or 'raise $ERROR_INFO'
    end

    # good
    def foo
      do_something
    rescue
      do_cleanup
      raise
    end

    # bad (latest rescue)
    def foo
      do_something
    rescue ArgumentError
      # noop
    rescue
      raise
    end

    # good (not the latest rescue)
    def foo
      do_something
    rescue ArgumentError
      raise
    rescue
      # noop
    end
