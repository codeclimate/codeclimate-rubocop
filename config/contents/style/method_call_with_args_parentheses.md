This cop checks presence of parentheses in method calls containing
parameters. By default, macro methods are ignored. Additional methods
can be added to the `IgnoredMethods` list.

### Example:

    # bad
    array.delete e

    # good
    array.delete(e)

    # good
    # Operators don't need parens
    foo == bar

    # good
    # Setter methods don't need parens
    foo.bar = baz

    # okay with `puts` listed in `IgnoredMethods`
    puts 'test'

    # IgnoreMacros: true (default)

    # good
    class Foo
      bar :baz
    end

    # IgnoreMacros: false

    # bad
    class Foo
      bar :baz
    end