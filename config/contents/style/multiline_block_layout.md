This cop checks whether the multiline do end blocks have a newline
after the start of the block. Additionally, it checks whether the block
arguments, if any, are on the same line as the start of the block.

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