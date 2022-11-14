Checks for duplicated magic comments.

### Example:

    # bad

    # encoding: ascii
    # encoding: ascii

    # good

    # encoding: ascii

    # bad

    # frozen_string_literal: true
    # frozen_string_literal: true

    # good

    # frozen_string_literal: true
