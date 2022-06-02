Looks for trailing whitespace in the source code.

### Example:
    # The line in this example contains spaces after the 0.
    # bad
    x = 0

    # The line in this example ends directly after the 0.
    # good
    x = 0

### Example: AllowInHeredoc: false (default)
    # The line in this example contains spaces after the 0.
    # bad
    code = <<~RUBY
      x = 0
    RUBY

    # ok
    code = <<~RUBY
      x = 0 #{}
    RUBY

    # good
    trailing_whitespace = ' '
    code = <<~RUBY
      x = 0#{trailing_whitespace}
    RUBY

### Example: AllowInHeredoc: true
    # The line in this example contains spaces after the 0.
    # good
    code = <<~RUBY
      x = 0
    RUBY
