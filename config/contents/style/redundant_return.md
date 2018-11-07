This cop checks for redundant `return` expressions.

### Example:

    def test
      return something
    end

    def test
      one
      two
      three
      return something
    end

It should be extended to handle methods whose body is if/else
or a case expression with a default branch.