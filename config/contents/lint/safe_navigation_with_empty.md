Checks to make sure safe navigation isn't used with `empty?` in
a conditional.

While the safe navigation operator is generally a good idea, when
checking `foo&.empty?` in a conditional, `foo` being `nil` will actually
do the opposite of what the author intends.

### Example:
    # bad
    return if foo&.empty?
    return unless foo&.empty?

    # good
    return if foo && foo.empty?
    return unless foo && foo.empty?
