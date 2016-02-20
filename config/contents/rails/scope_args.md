This cop checks for scope calls where it was passed
a method (usually a scope) instead of a lambda/proc.

### Example:

    # bad
    scope :something, where(something: true)

    # good
    scope :something, -> { where(something: true) }