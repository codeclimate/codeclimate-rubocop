This cop checks whether some constant value isn't a
mutable literal (e.g. array or hash).

Strict mode can be used to freeze all constants, rather than
just literals.
Strict mode is considered an experimental feature. It has not been
updated with an exhaustive list of all methods that will produce
frozen objects so there is a decent chance of getting some false
positives. Luckily, there is no harm in freezing an already
frozen object.

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