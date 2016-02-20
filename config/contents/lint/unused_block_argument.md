This cop checks for unused block arguments.

### Example:

    do_something do |used, unused, _unused_but_allowed|
      puts used
    end