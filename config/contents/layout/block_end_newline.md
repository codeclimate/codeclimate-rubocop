Checks whether the end statement of a do..end block
is on its own line.

### Example:
    # bad
    blah do |i|
      foo(i) end

    # good
    blah do |i|
      foo(i)
    end

    # bad
    blah { |i|
      foo(i) }

    # good
    blah { |i|
      foo(i)
    }