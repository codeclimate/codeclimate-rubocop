This cop checks for unused block arguments.

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

### Example:

    #good

    do_something do |used, _unused|
      puts used
    end

    do_something do
      puts :foo
    end

    define_method(:foo) do |_bar|
      puts :baz
    end