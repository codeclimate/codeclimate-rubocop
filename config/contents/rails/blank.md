This cops checks for code that can be changed to `blank?`.
Settings:
    NilOrEmpty: Convert checks for `nil` or `empty?` to `blank?`
    NotPresent: Convert usages of not `present?` to `blank?`
    UnlessPresent: Convert usages of `unless` `present?` to `blank?`

### Example:
    # NilOrEmpty: true
      # bad
      foo.nil? || foo.empty?
      foo == nil || foo.empty?

      # good
      foo.blank?

    # NotPresent: true
      # bad
      !foo.present?

      # good
      foo.blank?

    # UnlessPresent: true
      # bad
      something unless foo.present?
      unless foo.present?
        something
      end

      # good
      something if foo.blank?
      if foo.blank?
        something
      end