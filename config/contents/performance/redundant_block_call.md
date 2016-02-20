This cop identifies the use of a `&block` parameter and `block.call`
where `yield` would do just as well.

### Example:
    # bad
    def method(&block)
      block.call
    end
    def another(&func)
      func.call 1, 2, 3
    end

    # good
    def method
      yield
    end
    def another
      yield 1, 2, 3
    end