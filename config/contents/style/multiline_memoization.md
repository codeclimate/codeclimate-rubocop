This cop checks that multiline memoizations are wrapped in a `begin`
and `end` block.

### Example:

    # bad
    foo ||= (
      bar
      baz
    )

    # good
    foo ||= begin
      bar
      baz
    end