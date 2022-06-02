Checks for `rescue` blocks with no body.

### Example:

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
      handle_exception
    end

    # good
    begin
      do_something
    rescue
      handle_exception
    end

### Example: AllowComments: true (default)

    # good
    def some_method
      do_something
    rescue
      # do nothing
    end

    # good
    begin
      do_something
    rescue
      # do nothing
    end

### Example: AllowComments: false

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
      # do nothing
    end

### Example: AllowNil: true (default)

    # good
    def some_method
      do_something
    rescue
      nil
    end

    # good
    begin
      do_something
    rescue
      # do nothing
    end

    # good
    do_something rescue nil

### Example: AllowNil: false

    # bad
    def some_method
      do_something
    rescue
      nil
    end

    # bad
    begin
      do_something
    rescue
      nil
    end

    # bad
    do_something rescue nil