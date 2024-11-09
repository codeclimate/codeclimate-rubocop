Detects instances of rubocop:enable comments that can be
removed.

When comment enables all cops at once `rubocop:enable all`
that cop checks whether any cop was actually enabled.

### Example:

    # bad
    foo = 1
    # rubocop:enable Layout/LineLength

    # good
    foo = 1

    # bad
    # rubocop:disable Style/StringLiterals
    foo = "1"
    # rubocop:enable Style/StringLiterals
    baz
    # rubocop:enable all

    # good
    # rubocop:disable Style/StringLiterals
    foo = "1"
    # rubocop:enable all
    baz