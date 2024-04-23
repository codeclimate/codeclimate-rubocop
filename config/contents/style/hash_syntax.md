Checks hash literal syntax.

It can enforce either the use of the class hash rocket syntax or
the use of the newer Ruby 1.9 syntax (when applicable).

A separate offense is registered for each problematic pair.

The supported styles are:

* ruby19 - forces use of the 1.9 syntax (e.g. `{a: 1}`) when hashes have
all symbols for keys
* hash_rockets - forces use of hash rockets for all hashes
* no_mixed_keys - simply checks for hashes with mixed syntaxes
* ruby19_no_mixed_keys - forces use of ruby 1.9 syntax and forbids mixed
syntax hashes

This cop has `EnforcedShorthandSyntax` option.
It can enforce either the use of the explicit hash value syntax or
the use of Ruby 3.1's hash value shorthand syntax.

The supported styles are:

* always - forces use of the 3.1 syntax (e.g. {foo:})
* never - forces use of explicit hash literal value
* either - accepts both shorthand and explicit use of hash literal value
* consistent - forces use of the 3.1 syntax only if all values can be omitted in the hash
* either_consistent - accepts both shorthand and explicit use of hash literal value,
                        but they must be consistent

### Example: EnforcedStyle: ruby19 (default)
    # bad
    {:a => 2}
    {b: 1, :c => 2}

    # good
    {a: 2, b: 1}
    {:c => 2, 'd' => 2} # acceptable since 'd' isn't a symbol
    {d: 1, 'e' => 2} # technically not forbidden

### Example: EnforcedStyle: hash_rockets
    # bad
    {a: 1, b: 2}
    {c: 1, 'd' => 5}

    # good
    {:a => 1, :b => 2}

### Example: EnforcedStyle: no_mixed_keys
    # bad
    {:a => 1, b: 2}
    {c: 1, 'd' => 2}

    # good
    {:a => 1, :b => 2}
    {c: 1, d: 2}

### Example: EnforcedStyle: ruby19_no_mixed_keys
    # bad
    {:a => 1, :b => 2}
    {c: 2, 'd' => 3} # should just use hash rockets

    # good
    {a: 1, b: 2}
    {:c => 3, 'd' => 4}

### Example: EnforcedShorthandSyntax: always (default)

    # bad
    {foo: foo, bar: bar}

    # good
    {foo:, bar:}

### Example: EnforcedShorthandSyntax: never

    # bad
    {foo:, bar:}

    # good
    {foo: foo, bar: bar}

### Example: EnforcedShorthandSyntax: either

    # good
    {foo: foo, bar: bar}

    # good
    {foo: foo, bar:}

    # good
    {foo:, bar:}

### Example: EnforcedShorthandSyntax: consistent

    # bad - `foo` and `bar` values can be omitted
    {foo: foo, bar: bar}

    # bad - `bar` value can be omitted
    {foo:, bar: bar}

    # bad - mixed syntaxes
    {foo:, bar: baz}

    # good
    {foo:, bar:}

    # good - can't omit `baz`
    {foo: foo, bar: baz}

### Example: EnforcedShorthandSyntax: either_consistent

    # good - `foo` and `bar` values can be omitted, but they are consistent, so it's accepted
    {foo: foo, bar: bar}

    # bad - `bar` value can be omitted
    {foo:, bar: bar}

    # bad - mixed syntaxes
    {foo:, bar: baz}

    # good
    {foo:, bar:}

    # good - can't omit `baz`
    {foo: foo, bar: baz}