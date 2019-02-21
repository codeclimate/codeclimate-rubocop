This cop enforces the presence (default) or absence of parentheses in
method calls containing parameters.

In the default style (require_parentheses), macro methods are ignored.
Additional methods can be added to the `IgnoredMethods` list. This
option is valid only in the default style.

In the alternative style (omit_parentheses), there are three additional
options.

1. `AllowParenthesesInChaining` is `false` by default. Setting it to
     `true` allows the presence of parentheses in the last call during
     method chaining.

2. `AllowParenthesesInMultilineCall` is `false` by default. Setting it
      to `true` allows the presence of parentheses in multi-line method
      calls.

3. `AllowParenthesesInCamelCaseMethod` is `false` by default. This
      allows the presence of parentheses when calling a method whose name
      begins with a capital letter and which has no arguments. Setting it
      to `true` allows the presence of parentheses in such a method call
      even with arguments.

### Example: EnforcedStyle: require_parentheses (default)


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

### Example: EnforcedStyle: omit_parentheses

    # bad
    array.delete(e)

    # good
    array.delete e

    # bad
    foo.enforce(strict: true)

    # good
    foo.enforce strict: true

    # AllowParenthesesInMultilineCall: false (default)

    # bad
    foo.enforce(
      strict: true
    )

    # good
    foo.enforce \
      strict: true

    # AllowParenthesesInMultilineCall: true

    # good
    foo.enforce(
      strict: true
    )

    # good
    foo.enforce \
      strict: true

    # AllowParenthesesInChaining: false (default)

    # bad
    foo().bar(1)

    # good
    foo().bar 1

    # AllowParenthesesInChaining: true

    # good
    foo().bar(1)

    # good
    foo().bar 1

    # AllowParenthesesInCamelCaseMethod: false (default)

    # bad
    Array(1)

    # good
    Array 1

    # AllowParenthesesInCamelCaseMethod: true

    # good
    Array(1)

    # good
    Array 1