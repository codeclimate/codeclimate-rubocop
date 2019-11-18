Checks for `if` and `unless` statements that would fit on one line if
written as modifier `if`/`unless`. The cop also checks for modifier
`if`/`unless` lines that exceed the maximum line length.

The maximum line length is configured in the `Metrics/LineLength`
cop. The tab size is configured in the `IndentationWidth` of the
`Layout/Tab` cop.

### Example:
    # bad
    if condition
      do_stuff(bar)
    end

    unless qux.empty?
      Foo.do_something
    end

    do_something_in_a_method_with_a_long_name(arg) if long_condition

    # good
    do_stuff(bar) if condition
    Foo.do_something unless qux.empty?

    if long_condition
      do_something_in_a_method_with_a_long_name(arg)
    end