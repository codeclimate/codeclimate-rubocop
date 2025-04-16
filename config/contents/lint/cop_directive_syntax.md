Checks that `# rubocop:enable ...` and `# rubocop:disable ...` statements
are strictly formatted.

A comment can be added to the directive by prefixing it with `--`.

### Example:
    # bad
    # rubocop:disable Layout/LineLength Style/Encoding
    #                                  ^ missing comma

    # bad
    # rubocop:disable

    # bad
    # rubocop:disable Layout/LineLength # rubocop:disable Style/Encoding

    # bad
    # rubocop:wrongmode Layout/LineLength

    # good
    # rubocop:disable Layout/LineLength

    # good
    # rubocop:disable Layout/LineLength, Style/Encoding

    # good
    # rubocop:disable all

    # good
    # rubocop:disable Layout/LineLength -- This is a good comment.
