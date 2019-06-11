This cop checks for code that can be written with simpler conditionals
using `Object#blank?` defined by Active Support.

### Example: NilOrEmpty: true (default)
    # Converts usages of `nil? || empty?` to `blank?`

    # bad
    foo.nil? || foo.empty?
    foo == nil || foo.empty?

    # good
    foo.blank?

### Example: NotPresent: true (default)
    # Converts usages of `!present?` to `blank?`

    # bad
    !foo.present?

    # good
    foo.blank?

### Example: UnlessPresent: true (default)
    # Converts usages of `unless present?` to `if blank?`

    # bad
    something unless foo.present?

    # good
    something if foo.blank?

    # bad
    unless foo.present?
      something
    end

    # good
    if foo.blank?
      something
    end