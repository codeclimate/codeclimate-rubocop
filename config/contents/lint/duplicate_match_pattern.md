Checks that there are no repeated patterns used in `in` keywords.

### Example:

    # bad
    case x
    in 'first'
      do_something
    in 'first'
      do_something_else
    end

    # good
    case x
    in 'first'
      do_something
    in 'second'
      do_something_else
    end

    # bad - repeated alternate patterns with the same conditions don't depend on the order
    case x
    in foo | bar
      first_method
    in bar | foo
      second_method
    end

    # good
    case x
    in foo | bar
      first_method
    in bar | baz
      second_method
    end

    # bad - repeated hash patterns with the same conditions don't depend on the order
    case x
    in foo: a, bar: b
      first_method
    in bar: b, foo: a
      second_method
    end

    # good
    case x
    in foo: a, bar: b
      first_method
    in bar: b, baz: c
      second_method
    end

    # bad - repeated array patterns with elements in the same order
    case x
    in [foo, bar]
      first_method
    in [foo, bar]
      second_method
    end

    # good
    case x
    in [foo, bar]
      first_method
    in [bar, foo]
      second_method
    end

    # bad - repeated the same patterns and guard conditions
    case x
    in foo if bar
      first_method
    in foo if bar
      second_method
    end

    # good
    case x
    in foo if bar
      first_method
    in foo if baz
      second_method
    end
