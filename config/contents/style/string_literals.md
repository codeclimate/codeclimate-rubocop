Checks if uses of quotes match the configured preference.

### Example: EnforcedStyle: single_quotes (default)
    # bad
    "No special symbols"
    "No string interpolation"
    "Just text"

    # good
    'No special symbols'
    'No string interpolation'
    'Just text'
    "Wait! What's #{this}!"

### Example: EnforcedStyle: double_quotes
    # bad
    'Just some text'
    'No special chars or interpolation'

    # good
    "Just some text"
    "No special chars or interpolation"
    "Every string in #{project} uses double_quotes"