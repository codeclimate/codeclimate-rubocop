Checks for unused block arguments.

### Example:
    # bad
    do_something do |used, unused|
      puts used
    end

    do_something do |bar|
      puts :foo
    end

    define_method(:foo) do |bar|
      puts :baz
    end

    # good
    do_something do |used, _unused|
      puts used
    end

    do_something do
      puts :foo
    end

    define_method(:foo) do |_bar|
      puts :baz
    end

### Example: IgnoreEmptyBlocks: true (default)
    # good
    do_something { |unused| }

### Example: IgnoreEmptyBlocks: false
    # bad
    do_something { |unused| }

### Example: AllowUnusedKeywordArguments: false (default)
    # bad
    do_something do |unused: 42|
      foo
    end

### Example: AllowUnusedKeywordArguments: true
    # good
    do_something do |unused: 42|
      foo
    end
