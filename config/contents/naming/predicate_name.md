Checks that predicate methods names end with a question mark and
do not start with a forbidden prefix.

A method is determined to be a predicate method if its name starts
with one of the prefixes defined in the `NamePrefix` configuration.
You can change what prefixes are considered by changing this option.
Any method name that starts with one of these prefixes is required by
the cop to end with a `?`. Other methods can be allowed by adding to
the `AllowedMethods` configuration.

NOTE: The `is_a?` method is allowed by default.

If `ForbiddenPrefixes` is set, methods that start with the configured
prefixes will not be allowed and will be removed by autocorrection.

In other words, if `ForbiddenPrefixes` is empty, a method named `is_foo`
will register an offense only due to the lack of question mark (and will be
autocorrected to `is_foo?`). If `ForbiddenPrefixes` contains `is_`,
`is_foo` will register an offense both because the ? is missing and because of
the `is_` prefix, and will be corrected to `foo?`.

NOTE: `ForbiddenPrefixes` is only applied to prefixes in `NamePrefix`;
a prefix in the former but not the latter will not be considered by
this cop.

### Example:
    # bad
    def is_even(value)
    end

    def is_even?(value)
    end

    # good
    def even?(value)
    end

    # bad
    def has_value
    end

    def has_value?
    end

    # good
    def value?
    end

### Example: AllowedMethods: ['is_a?'] (default)
    # good
    def is_a?(value)
    end
