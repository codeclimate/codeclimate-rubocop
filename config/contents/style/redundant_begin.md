Checks for redundant `begin` blocks.

Currently it checks for code like this:

### Example:

    # bad
    def redundant
      begin
        ala
        bala
      rescue StandardError => e
        something
      end
    end

    # good
    def preferred
      ala
      bala
    rescue StandardError => e
      something
    end

    # bad
    begin
      do_something
    end

    # good
    do_something

    # bad
    # When using Ruby 2.5 or later.
    do_something do
      begin
        something
      rescue => ex
        anything
      end
    end

    # good
    # In Ruby 2.5 or later, you can omit `begin` in `do-end` block.
    do_something do
      something
    rescue => ex
      anything
    end

    # good
    # Stabby lambdas don't support implicit `begin` in `do-end` blocks.
    -> do
      begin
        foo
      rescue Bar
        baz
      end
    end