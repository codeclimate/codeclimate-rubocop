Checks whether the end keyword of `begin` is aligned properly.

Two modes are supported through the `EnforcedStyleAlignWith` configuration
parameter. If it's set to `start_of_line` (which is the default), the
`end` shall be aligned with the start of the line where the `begin`
keyword is. If it's set to `begin`, the `end` shall be aligned with the
`begin` keyword.

`Layout/EndAlignment` cop aligns with keywords (e.g. `if`, `while`, `case`)
by default. On the other hand, `||= begin` that this cop targets tends to
align with the start of the line, it defaults to `EnforcedStyleAlignWith: start_of_line`.
These style can be configured by each cop.

### Example: EnforcedStyleAlignWith: start_of_line (default)
    # bad
    foo ||= begin
              do_something
            end

    # good
    foo ||= begin
      do_something
    end

### Example: EnforcedStyleAlignWith: begin
    # bad
    foo ||= begin
      do_something
    end

    # good
    foo ||= begin
              do_something
            end
