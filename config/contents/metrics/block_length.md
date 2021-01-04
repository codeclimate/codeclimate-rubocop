This cop checks if the length of a block exceeds some maximum value.
Comment lines can optionally be ignored.
The maximum allowed length is configurable.
The cop can be configured to ignore blocks passed to certain methods.

You can set literals you want to fold with `CountAsOne`.
Available are: 'array', 'hash', and 'heredoc'. Each literal
will be counted as one line regardless of its actual size.


NOTE: The `ExcludedMethods` configuration is deprecated and only kept
for backwards compatibility. Please use `IgnoredMethods` instead.

### Example: CountAsOne: ['array', 'heredoc']

    something do
      array = [         # +1
        1,
        2
      ]

      hash = {          # +3
        key: 'value'
      }

      msg = <<~HEREDOC  # +1
        Heredoc
        content.
      HEREDOC
    end                 # 5 points

NOTE: This cop does not apply for `Struct` definitions.