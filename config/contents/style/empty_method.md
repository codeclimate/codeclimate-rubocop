Checks for the formatting of empty method definitions.
By default it enforces empty method definitions to go on a single
line (compact style), but it can be configured to enforce the `end`
to go on its own line (expanded style).

NOTE: A method definition is not considered empty if it contains
comments.

NOTE: Autocorrection will not be applied for the `compact` style
if the resulting code is longer than the `Max` configuration for
`Layout/LineLength`, but an offense will still be registered.

### Example: EnforcedStyle: compact (default)
    # bad
    def foo(bar)
    end

    def self.foo(bar)
    end

    # good
    def foo(bar); end

    def foo(bar)
      # baz
    end

    def self.foo(bar); end

### Example: EnforcedStyle: expanded
    # bad
    def foo(bar); end

    def self.foo(bar); end

    # good
    def foo(bar)
    end

    def self.foo(bar)
    end