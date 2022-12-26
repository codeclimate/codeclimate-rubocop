Checks if the length a class exceeds some maximum value.
Comment lines can optionally be ignored.
The maximum allowed length is configurable.

You can set constructs you want to fold with `CountAsOne`.
Available are: 'array', 'hash', 'heredoc', and 'method_call'. Each construct
will be counted as one line regardless of its actual size.

### Example: CountAsOne: ['array', 'heredoc', 'method_call']

    class Foo
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

      foo(              # +1
        1,
        2
      )
    end                 # 6 points


NOTE: This cop also applies for `Struct` definitions.