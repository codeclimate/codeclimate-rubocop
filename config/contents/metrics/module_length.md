Checks if the length a module exceeds some maximum value.
Comment lines can optionally be ignored.
The maximum allowed length is configurable.

You can set literals you want to fold with `CountAsOne`.
Available are: 'array', 'hash', and 'heredoc'. Each literal
will be counted as one line regardless of its actual size.

### Example: CountAsOne: ['array', 'heredoc']

    module M
      ARRAY = [         # +1
        1,
        2
      ]

      HASH = {          # +3
        key: 'value'
      }

      MSG = <<~HEREDOC  # +1
        Heredoc
        content.
      HEREDOC
    end                 # 5 points
