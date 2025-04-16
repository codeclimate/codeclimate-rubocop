Before Ruby 3.0, interpolated strings followed the frozen string literal
magic comment which sometimes made it necessary to explicitly unfreeze them.
Ruby 3.0 changed interpolated strings to always be unfrozen which makes
unfreezing them redundant.

### Example:
    # bad
    +"#{foo} bar"

    # bad
    "#{foo} bar".dup

    # good
    "#{foo} bar"
