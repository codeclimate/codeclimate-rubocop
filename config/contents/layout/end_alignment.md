Checks whether the end keywords are aligned properly.

Three modes are supported through the `EnforcedStyleAlignWith`
configuration parameter:

If it's set to `keyword` (which is the default), the `end`
shall be aligned with the start of the keyword (if, class, etc.).

If it's set to `variable` the `end` shall be aligned with the
left-hand-side of the variable assignment, if there is one.

If it's set to `start_of_line`, the `end` shall be aligned with the
start of the line where the matching keyword appears.

This `Layout/EndAlignment` cop aligns with keywords (e.g. `if`, `while`, `case`)
by default. On the other hand, `Layout/BeginEndAlignment` cop aligns with
`EnforcedStyleAlignWith: start_of_line` by default due to `||= begin` tends
to align with the start of the line. `Layout/DefEndAlignment` cop also aligns with
`EnforcedStyleAlignWith: start_of_line` by default.
These style can be configured by each cop.

### Example: EnforcedStyleAlignWith: keyword (default)
    # bad

    variable = if true
        end

    # good

    variable = if true
               end

    variable =
      if true
      end

### Example: EnforcedStyleAlignWith: variable
    # bad

    variable = if true
        end

    # good

    variable = if true
    end

    variable =
      if true
      end

### Example: EnforcedStyleAlignWith: start_of_line
    # bad

    variable = if true
        end

    puts(if true
         end)

    # good

    variable = if true
    end

    puts(if true
    end)

    variable =
      if true
      end