Use a guard clause instead of wrapping the code inside a conditional
expression

### Example:
    # bad
    def test
      if something
        work
      end
    end

    # good
    def test
      return unless something

      work
    end

    # also good
    def test
      work if something
    end

    # bad
    if something
      raise 'exception'
    else
      ok
    end

    # good
    raise 'exception' if something
    ok

    # bad
    if something
      foo || raise('exception')
    else
      ok
    end

    # good
    foo || raise('exception') if something
    ok

### Example: AllowConsecutiveConditionals: false (default)
    # bad
    if foo?
      work
    end

    if bar?  # <- reports an offense
      work
    end

### Example: AllowConsecutiveConditionals: true
    # good
    if foo?
      work
    end

    if bar?
      work
    end

    # bad
    if foo?
      work
    end

    do_something

    if bar?  # <- reports an offense
      work
    end