Ensures magic comments are written consistently throughout your code base.
Looks for discrepancies in separators (`-` vs `_`) and capitalization for
both magic comment directives and values.

Required capitalization can be set with the `DirectiveCapitalization` and
`ValueCapitalization` configuration keys.

NOTE: If one of these configuration is set to nil, any capitalization is allowed.

### Example: EnforcedStyle: snake_case (default)
    # The `snake_case` style will enforce that the frozen string literal
    # comment is written in snake case. (Words separated by underscores)
    # bad
    # frozen-string-literal: true

    module Bar
      # ...
    end

    # good
    # frozen_string_literal: false

    module Bar
      # ...
    end

### Example: EnforcedStyle: kebab_case
    # The `kebab_case` style will enforce that the frozen string literal
    # comment is written in kebab case. (Words separated by hyphens)
    # bad
    # frozen_string_literal: true

    module Baz
      # ...
    end

    # good
    # frozen-string-literal: true

    module Baz
      # ...
    end

### Example: DirectiveCapitalization: lowercase (default)
    # bad
    # FROZEN-STRING-LITERAL: true

    # good
    # frozen-string-literal: true

### Example: DirectiveCapitalization: uppercase
    # bad
    # frozen-string-literal: true

    # good
    # FROZEN-STRING-LITERAL: true

### Example: DirectiveCapitalization: nil
    # any capitalization is accepted

    # good
    # frozen-string-literal: true

    # good
    # FROZEN-STRING-LITERAL: true

### Example: ValueCapitalization: nil (default)
    # any capitalization is accepted

    # good
    # frozen-string-literal: true

    # good
    # frozen-string-literal: TRUE

### Example: ValueCapitalization: lowercase
    # when a value is not given, any capitalization is accepted

    # bad
    # frozen-string-literal: TRUE

    # good
    # frozen-string-literal: TRUE

### Example: ValueCapitalization: uppercase
    # bad
    # frozen-string-literal: true

    # good
    # frozen-string-literal: TRUE
