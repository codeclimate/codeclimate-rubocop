Checks for single-line `do`...`end` block.

In practice a single line `do`...`end` is autocorrected when `EnforcedStyle: semantic`
is configured for `Style/BlockDelimiters`. The autocorrection maintains the
`do` ... `end` syntax to preserve semantics and does not change it to `{`...`}` block.

NOTE: If `InspectBlocks` is set to `true` for `Layout/RedundantLineBreak`, blocks will
be autocorrected to be on a single line if possible. This cop respects that configuration
by not registering an offense if it would subsequently cause a
`Layout/RedundantLineBreak` offense.

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
