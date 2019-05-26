This cop checks for *rescue* blocks with no body.

### Example: AllowComments: false (default)

    # bad
    def some_method
      do_something
    rescue
    end

    # bad
    def some_method
      do_something
    rescue
      # do nothing
    end

    # bad
    begin
      do_something
    rescue
    end

    # bad
    begin
      do_something
    rescue
      # do nothing
    end

    # good
    def some_method
      do_something
    rescue
      handle_exception
    end

    # good
    begin
      do_something
    rescue
      handle_exception
    end

### Example: AllowComments: true

    # bad
    def some_method
      do_something
    rescue
    end

    # bad
    begin
      do_something
    rescue
    end

    # good
    def some_method
      do_something
    rescue
      # do nothing but comment
    end

    # good
    begin
      do_something
    rescue
      # do nothing but comment
    end