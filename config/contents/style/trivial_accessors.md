This cop looks for trivial reader/writer methods, that could
have been created with the attr_* family of functions automatically.

### Example:
    # bad
    def foo
      @foo
    end

    def bar=(val)
      @bar = val
    end

    def self.baz
      @baz
    end

    # good
    attr_reader :foo
    attr_writer :bar

    class << self
      attr_reader :baz
    end