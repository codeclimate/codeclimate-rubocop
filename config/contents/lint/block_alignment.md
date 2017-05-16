This cop checks whether the end keywords are aligned properly for do
end blocks.

Three modes are supported through the `EnforcedStyleAlignWith`
configuration parameter:

`start_of_block` : the `end` shall be aligned with the
start of the line where the `do` appeared.

`start_of_line` : the `end` shall be aligned with the
start of the line where the expression started.

`either` (which is the default) : the `end` is allowed to be in either
location. The autofixer will default to `start_of_line`.

### Example:

    # bad

    foo.bar
       .each do
         baz
           end

### Example:

    # EnforcedStyleAlignWith: either (default)

    # good

    variable = lambda do |i|
      i
    end

### Example:

    # EnforcedStyleAlignWith: start_of_block

    # good

    foo.bar
      .each do
         baz
       end

### Example:

    # EnforcedStyleAlignWith: start_of_line

    # good

    foo.bar
      .each do
         baz
    end