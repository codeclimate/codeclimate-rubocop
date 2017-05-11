Checks for a newline after the final magic comment.

### Example:
    # good
    # frozen_string_literal: true

    # Some documentation for Person
    class Person
      # Some code
    end

    # bad
    # frozen_string_literal: true
    # Some documentation for Person
    class Person
      # Some code
    end