Checks for if and unless statements that would fit on one line
if written as a modifier if/unless. The maximum line length is
configured in the `Metrics/LineLength` cop.

### Example:
    # bad
    if condition
      do_stuff(bar)
    end

    unless qux.empty?
      Foo.do_something
    end

    # good
    do_stuff(bar) if condition
    Foo.do_something unless qux.empty?