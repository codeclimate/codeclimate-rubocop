This cops checks the indentation of comments.

### Example:
    # bad
      # comment here
    def method_name
    end

      # comment here
    a = 'hello'

    # yet another comment
      if true
        true
      end

    # good
    # comment here
    def method_name
    end

    # comment here
    a = 'hello'

    # yet another comment
    if true
      true
    end
