Checks for single-line `do`...`end` block.

In practice a single line `do`...`end` is autocorrected when `EnforcedStyle: semantic`
in `Style/BlockDelimiters`. The autocorrection maintains the `do` ... `end` syntax to
preserve semantics and does not change it to `{`...`}` block.

### Example:

    # bad
    foo do |arg| bar(arg) end

    # good
    foo do |arg|
      bar(arg)
    end

    # bad
    ->(arg) do bar(arg) end

    # good
    ->(arg) { bar(arg) }
