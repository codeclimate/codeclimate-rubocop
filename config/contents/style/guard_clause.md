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