Place `when` conditions that use splat at the end
of the list of `when` branches.

Ruby has to allocate memory for the splat expansion every time
that the `case` `when` statement is run. Since Ruby does not support
fall through inside of `case` `when`, like some other languages do,
the order of the `when` branches does not matter. By placing any
splat expansions at the end of the list of `when` branches we will
reduce the number of times that memory has to be allocated for
the expansion.

This is not a guaranteed performance improvement. If the data being
processed by the `case` condition is normalized in a manner that favors
hitting a condition in the splat expansion, it is possible that
moving the splat condition to the end will use more memory,
and run slightly slower.

### Example:
    # bad
    case foo
    when *condition
      bar
    when baz
      foobar
    end

    case foo
    when *[1, 2, 3, 4]
      bar
    when 5
      baz
    end

    # good
    case foo
    when baz
      foobar
    when *condition
      bar
    end

    case foo
    when 1, 2, 3, 4
      bar
    when 5
      baz
    end