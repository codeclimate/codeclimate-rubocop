Checks if the length of a method exceeds some maximum value.
Comment lines can optionally be allowed.
The maximum allowed length is configurable.

You can set literals you want to fold with `CountAsOne`.
Available are: 'array', 'hash', and 'heredoc'. Each literal
will be counted as one line regardless of its actual size.

NOTE: The `ExcludedMethods` and `IgnoredMethods` configuration is
deprecated and only kept for backwards compatibility.
Please use `AllowedMethods` and `AllowedPatterns` instead.
By default, there are no methods to allowed.

### Example: CountAsOne: ['array', 'heredoc']

    def m
      array = [       # +1
        1,
        2
      ]

      hash = {        # +3
        key: 'value'
      }

      <<~HEREDOC      # +1
        Heredoc
        content.
      HEREDOC
    end               # 5 points
