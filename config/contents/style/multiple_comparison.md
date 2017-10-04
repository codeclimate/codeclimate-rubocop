This cop checks against comparing a variable with multiple items, where
`Array#include?` could be used instead to avoid code repetition.

### Example:
    # bad
    a = 'a'
    foo if a == 'a' || a == 'b' || a == 'c'

    # good
    a = 'a'
    foo if ['a', 'b', 'c'].include?(a)