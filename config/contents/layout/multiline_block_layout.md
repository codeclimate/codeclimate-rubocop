Checks whether the multiline do end blocks have a newline
after the start of the block. Additionally, it checks whether the block
arguments, if any, are on the same line as the start of the
block. Putting block arguments on separate lines, because the whole
line would otherwise be too long, is accepted.

### Example:
    # bad
    blah do |i| foo(i)
      bar(i)
    end

    # bad
    blah do
      |i| foo(i)
      bar(i)
    end

    # good
    blah do |i|
      foo(i)
      bar(i)
    end

    # bad
    blah { |i| foo(i)
      bar(i)
    }

    # good
    blah { |i|
      foo(i)
      bar(i)
    }

    # good
    blah { |
      long_list,
      of_parameters,
      that_would_not,
      fit_on_one_line
    |
      foo(i)
      bar(i)
    }