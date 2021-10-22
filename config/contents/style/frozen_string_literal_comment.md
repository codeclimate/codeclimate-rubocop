This cop is designed to help you transition from mutable string literals
to frozen string literals.
It will add the `# frozen_string_literal: true` magic comment to the top
of files to enable frozen string literals. Frozen string literals may be
default in future Ruby. The comment will be added below a shebang and
encoding comment.

Note that the cop will accept files where the comment exists but is set
to `false` instead of `true`.

To require a blank line after this comment, please see
`Layout/EmptyLineAfterMagicComment` cop.

### Safety:

 This cop's autocorrection is unsafe since any strings mutations will
 change from being accepted to raising `FrozenError`, as all strings
 will become frozen by default, and will need to be manually refactored.

### Example: EnforcedStyle: always (default)
    # The `always` style will always add the frozen string literal comment
    # to a file, regardless of the Ruby version or if `freeze` or `<<` are
    # called on a string literal.
    # bad
    module Bar
      # ...
    end

    # good
    # frozen_string_literal: true

    module Bar
      # ...
    end

    # good
    # frozen_string_literal: false

    module Bar
      # ...
    end

### Example: EnforcedStyle: never
    # The `never` will enforce that the frozen string literal comment does
    # not exist in a file.
    # bad
    # frozen_string_literal: true

    module Baz
      # ...
    end

    # good
    module Baz
      # ...
    end

### Example: EnforcedStyle: always_true
    # The `always_true` style enforces that the frozen string literal
    # comment is set to `true`. This is a stricter option than `always`
    # and forces projects to use frozen string literals.
    # bad
    # frozen_string_literal: false

    module Baz
      # ...
    end

    # bad
    module Baz
      # ...
    end

    # good
    # frozen_string_literal: true

    module Bar
      # ...
    end