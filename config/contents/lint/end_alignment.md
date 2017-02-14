This cop checks whether the end keywords are aligned properly.

Three modes are supported through the `AlignWith` configuration
parameter:

If it's set to `keyword` (which is the default), the `end`
shall be aligned with the start of the keyword (if, class, etc.).

If it's set to `variable` the `end` shall be aligned with the
left-hand-side of the variable assignment, if there is one.

If it's set to `start_of_line`, the `end` shall be aligned with the
start of the line where the matching keyword appears.

### Example:
    # good
    # keyword style
    variable = if true
               end

    # variable style
    variable = if true
    end

    # start_of_line style
    puts(if true
    end)