Checks for a newline after an attribute accessor or a group of them.
`alias` syntax and `alias_method`, `public`, `protected`, and `private` methods are allowed by default.
These are customizable with `AllowAliasSyntax` and `AllowedMethods` options.

### Example:
    # bad
    attr_accessor :foo
    def do_something
    end

    # good
    attr_accessor :foo

    def do_something
    end

    # good
    attr_accessor :foo
    attr_reader :bar
    attr_writer :baz
    attr :qux

    def do_something
    end

### Example: AllowAliasSyntax: true (default)
    # good
    attr_accessor :foo
    alias :foo? :foo

    def do_something
    end

### Example: AllowAliasSyntax: false
    # bad
    attr_accessor :foo
    alias :foo? :foo

    def do_something
    end

    # good
    attr_accessor :foo

    alias :foo? :foo

    def do_something
    end

### Example: AllowedMethods: ['private']
    # good
    attr_accessor :foo
    private :foo

    def do_something
    end
