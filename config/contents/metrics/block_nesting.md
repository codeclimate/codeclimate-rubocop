Checks for excessive nesting of conditional and looping constructs.

You can configure if blocks are considered using the `CountBlocks` and `CountModifierForms`
options. When both are set to `false` (the default) blocks and modifier forms are not
counted towards the nesting level. Set them to `true` to include these in the nesting level
calculation as well.

The maximum level of nesting allowed is configurable.