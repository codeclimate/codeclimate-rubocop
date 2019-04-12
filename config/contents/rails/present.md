This cop checks for code that can be written with simpler conditionals
using `Object#present?` defined by Active Support.

Interaction with `Style/UnlessElse`:
The configuration of `NotBlank` will not produce an offense in the
context of `unless else` if `Style/UnlessElse` is inabled. This is
to prevent interference between the auto-correction of the two cops.

### Example: NotNilAndNotEmpty: true (default)
    # Converts usages of `!nil? && !empty?` to `present?`

    # bad
    !foo.nil? && !foo.empty?

    # bad
    foo != nil && !foo.empty?

    # good
    foo.present?

### Example: NotBlank: true (default)
    # Converts usages of `!blank?` to `present?`

    # bad
    !foo.blank?

    # bad
    not foo.blank?

    # good
    foo.present?

### Example: UnlessBlank: true (default)
    # Converts usages of `unless blank?` to `if present?`

    # bad
    something unless foo.blank?

    # good
    something if foo.present?