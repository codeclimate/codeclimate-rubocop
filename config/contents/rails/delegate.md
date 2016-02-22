This cop looks for delegations, that could have been created
automatically with delegate method.

### Example:
    # bad
    def bar
      foo.bar
    end

    # good
    delegate :bar, to: :foo

    # bad
    def foo_bar
      foo.bar
    end

    # good
    delegate :bar, to: :foo, prefix: true

    # good
    private
    def bar
      foo.bar
    end