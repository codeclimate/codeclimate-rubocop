Checks the indentation of comments.

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

### Example: AllowForAlignment: false (default)
    # bad
    a = 1 # A really long comment
          # spanning two lines.

    # good
    # A really long comment spanning one line.
    a = 1

### Example: AllowForAlignment: true
    # good
    a = 1 # A really long comment
          # spanning two lines.