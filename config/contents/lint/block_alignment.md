This cop checks whether the end keywords are aligned properly for do
end blocks.

Three modes are supported through the `AlignWith` configuration
parameter:

`start_of_block` : the `end` shall be aligned with the
start of the line where the `do` appeared.

`start_of_line` : the `end` shall be aligned with the
start of the line where the expression started.

`either` (which is the default) : the `end` is allowed to be in either
location. The autofixer will default to `start_of_line`.

### Example:

    # either
    variable = lambda do |i|
      i
    end

    # start_of_block
    foo.bar
      .each do
         baz
       end

    # start_of_line
    foo.bar
      .each do
         baz
    end