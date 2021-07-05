This cop enforces the presence (default) or absence of parentheses in
method calls containing parameters.

In the default style (require_parentheses), macro methods are ignored.
Additional methods can be added to the `IgnoredMethods`
or `IgnoredPatterns` list. These options are
valid only in the default style. Macros can be included by
either setting `IgnoreMacros` to false or adding specific macros to
the `IncludedMacros` list.

Precedence of options is all follows:

1. `IgnoredMethods`
2. `IgnoredPatterns`
3. `IncludedMacros`

eg. If a method is listed in both
`IncludedMacros` and `IgnoredMethods`, then the latter takes
precedence (that is, the method is ignored).

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

NOTE: Parentheses are still allowed in cases where omitting them
results in ambiguous or syntactically incorrect code. For example,
parentheses are required around a method with arguments when inside an
endless method definition introduced in Ruby 3.0.  Parentheses are also
allowed when forwarding arguments with the triple-dot syntax introduced
in Ruby 2.7 as omitting them starts an endless range.

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

    # okay with `^assert` listed in `IgnoredPatterns`
    assert_equal 'test', x

### Example: EnforcedStyle: omit_parentheses

    # bad
    array.delete(e)

    # good
    array.delete e

    # bad
    foo.enforce(strict: true)

    # good
    foo.enforce strict: true

    # good
    # Allows parens for calls that won't produce valid Ruby or be ambiguous.
    model.validate strict(true)

    # good
    # Allows parens for calls that won't produce valid Ruby or be ambiguous.
    yield path, File.basename(path)

    # good
    # Operators methods calls with parens
    array&.[](index)

    # good
    # Operators methods without parens, if you prefer
    array.[] index

    # good
    # Operators methods calls with parens
    array&.[](index)

    # good
    # Operators methods without parens, if you prefer
    array.[] index

### Example: IgnoreMacros: true (default)

    # good
    class Foo
      bar :baz
    end

### Example: IgnoreMacros: false

    # bad
    class Foo
      bar :baz
    end

### Example: AllowParenthesesInMultilineCall: false (default)

    # bad
    foo.enforce(
      strict: true
    )

    # good
    foo.enforce \
      strict: true

### Example: AllowParenthesesInMultilineCall: true

    # good
    foo.enforce(
      strict: true
    )

    # good
    foo.enforce \
      strict: true

### Example: AllowParenthesesInChaining: false (default)

    # bad
    foo().bar(1)

    # good
    foo().bar 1

### Example: AllowParenthesesInChaining: true

    # good
    foo().bar(1)

    # good
    foo().bar 1

### Example: AllowParenthesesInCamelCaseMethod: false (default)

    # bad
    Array(1)

    # good
    Array 1

### Example: AllowParenthesesInCamelCaseMethod: true

    # good
    Array(1)

    # good
    Array 1

### Example: AllowParenthesesInStringInterpolation: false (default)

    # bad
    "#{t('this.is.bad')}"

    # good
    "#{t 'this.is.better'}"

### Example: AllowParenthesesInStringInterpolation: true

    # good
    "#{t('this.is.good')}"

    # good
    "#{t 'this.is.also.good'}"