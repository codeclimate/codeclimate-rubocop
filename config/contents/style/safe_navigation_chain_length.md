Enforces safe navigation chains length to not exceed the configured maximum.
The longer the chain is, the harder it becomes to track what on it could be
returning `nil`.

There is a potential interplay with `Style/SafeNavigation` - if both are enabled
and their settings are "incompatible", one of the cops will complain about what
the other proposes.

E.g. if `Style/SafeNavigation` is configured with `MaxChainLength: 2` (default)
and this cop is configured with `Max: 1`, then for `foo.bar.baz if foo` the former
will suggest `foo&.bar&.baz`, which is an offense for the latter.

### Example: Max: 2 (default)
    # bad
    user&.address&.zip&.upcase

    # good
    user&.address&.zip
    user.address.zip if user
