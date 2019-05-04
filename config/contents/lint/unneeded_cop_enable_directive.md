This cop detects instances of rubocop:enable comments that can be
removed.

When comment enables all cops at once `rubocop:enable all`
that cop checks whether any cop was actually enabled.
### Example:
    # bad
    foo = 1
    # rubocop:enable Metrics/LineLength

    # good
    foo = 1
### Example:
    # bad
    # rubocop:disable Metrics/LineLength
    baaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaarrrrrrrrrrrrr
    # rubocop:enable Metrics/LineLength
    baz
    # rubocop:enable all

    # good
    # rubocop:disable Metrics/LineLength
    baaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaarrrrrrrrrrrrr
    # rubocop:enable all
    baz