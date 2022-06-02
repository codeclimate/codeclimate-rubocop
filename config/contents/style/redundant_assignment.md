Checks for redundant assignment before returning.

### Example:
    # bad
    def test
      x = foo
      x
    end

    # bad
    def test
      if x
        z = foo
        z
      elsif y
        z = bar
        z
      end
    end

    # good
    def test
      foo
    end

    # good
    def test
      if x
        foo
      elsif y
        bar
      end
    end
