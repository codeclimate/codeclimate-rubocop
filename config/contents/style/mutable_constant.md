Checks whether some constant value isn't a
mutable literal (e.g. array or hash).

Strict mode can be used to freeze all constants, rather than
just literals.
Strict mode is considered an experimental feature. It has not been
updated with an exhaustive list of all methods that will produce
frozen objects so there is a decent chance of getting some false
positives. Luckily, there is no harm in freezing an already
frozen object.

From Ruby 3.0, this cop honours the magic comment
'shareable_constant_value'. When this magic comment is set to any
acceptable value other than none, it will suppress the offenses
raised by this cop. It enforces frozen state.

NOTE: `Regexp` and `Range` literals are frozen objects since Ruby 3.0.

NOTE: From Ruby 3.0, interpolated strings are not frozen when
`# frozen-string-literal: true` is used, so this cop enforces explicit
freezing for such strings.

NOTE: From Ruby 3.0, this cop allows explicit freezing of constants when
the `shareable_constant_value` directive is used.

### Safety:

This cop's autocorrection is unsafe since any mutations on objects that
are made frozen will change from being accepted to raising `FrozenError`,
and will need to be manually refactored.

### Example: EnforcedStyle: literals (default)
    # bad
    CONST = [1, 2, 3]

    # good
    CONST = [1, 2, 3].freeze

    # good
    CONST = <<~TESTING.freeze
      This is a heredoc
    TESTING

    # good
    CONST = Something.new


### Example: EnforcedStyle: strict
    # bad
    CONST = Something.new

    # bad
    CONST = Struct.new do
      def foo
        puts 1
      end
    end

    # good
    CONST = Something.new.freeze

    # good
    CONST = Struct.new do
      def foo
        puts 1
      end
    end.freeze

### Example:
    # Magic comment - shareable_constant_value: literal

    # bad
    CONST = [1, 2, 3]

    # good
    # shareable_constant_value: literal
    CONST = [1, 2, 3]
