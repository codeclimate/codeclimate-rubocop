Checks for a newline after attribute accessor.

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
