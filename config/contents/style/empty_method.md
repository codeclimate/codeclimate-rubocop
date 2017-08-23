This cop checks for the formatting of empty method definitions.
By default it enforces empty method definitions to go on a single
line (compact style), but it can be configured to enforce the `end`
to go on its own line (expanded style).

Note: A method definition is not considered empty if it contains
        comments.

### Example:

    # EnforcedStyle: compact (default)

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

    # EnforcedStyle: expanded

    # bad
    def foo(bar); end

    def self.foo(bar); end

    # good
    def foo(bar)
    end

    def self.foo(bar)
    end