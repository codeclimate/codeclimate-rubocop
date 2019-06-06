This cop checks that there is an `# rubocop:enable ...` statement
after a `# rubocop:disable ...` statement. This will prevent leaving
cop disables on wide ranges of code, that latter contributors to
a file wouldn't be aware of.

### Example:
    # Lint/MissingCopEnableDirective:
    #   MaximumRangeSize: .inf

    # good
    # rubocop:disable Layout/SpaceAroundOperators
    x= 0
    # rubocop:enable Layout/SpaceAroundOperators
    # y = 1
    # EOF

    # bad
    # rubocop:disable Layout/SpaceAroundOperators
    x= 0
    # EOF

### Example:
    # Lint/MissingCopEnableDirective:
    #   MaximumRangeSize: 2

    # good
    # rubocop:disable Layout/SpaceAroundOperators
    x= 0
    # With the previous, there are 2 lines on which cop is disabled.
    # rubocop:enable Layout/SpaceAroundOperators

    # bad
    # rubocop:disable Layout/SpaceAroundOperators
    x= 0
    x += 1
    # Including this, that's 3 lines on which the cop is disabled.
    # rubocop:enable Layout/SpaceAroundOperators
