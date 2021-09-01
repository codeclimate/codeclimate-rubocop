This cop checks for ambiguous ranges.

Ranges have quite low precedence, which leads to unexpected behaviour when
using a range with other operators. This cop avoids that by making ranges
explicit by requiring parenthesis around complex range boundaries (anything
that is not a basic literal: numerics, strings, symbols, etc.).

NOTE: The cop auto-corrects by wrapping the entire boundary in parentheses, which
makes the outcome more explicit but is possible to not be the intention of the
programmer. For this reason, this cop's auto-correct is marked as unsafe (it
will not change the behaviour of the code, but will not necessarily match the
intent of the program).

This cop can be configured with `RequireParenthesesForMethodChains` in order to
specify whether method chains (including `self.foo`) should be wrapped in parens
by this cop.

NOTE: Regardless of this configuration, if a method receiver is a basic literal
value, it will be wrapped in order to prevent the ambiguity of `1..2.to_a`.

### Example:
    # bad
    x || 1..2
    (x || 1..2)
    1..2.to_a

    # good, unambiguous
    1..2
    'a'..'z'
    :bar..:baz
    MyClass::MIN..MyClass::MAX
    @min..@max
    a..b
    -a..b

    # good, ambiguity removed
    x || (1..2)
    (x || 1)..2
    (x || 1)..(y || 2)
    (1..2).to_a

### Example: RequireParenthesesForMethodChains: false (default)
    # good
    a.foo..b.bar
    (a.foo)..(b.bar)

### Example: RequireParenthesesForMethodChains: true
    # bad
    a.foo..b.bar

    # good
    (a.foo)..(b.bar)
