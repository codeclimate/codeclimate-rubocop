Checks for trailing code after the method definition.

### Example:
    # bad
    def some_method
    do_stuff; end

    def do_this(x)
      baz.map { |b| b.this(x) } end

    def foo
      block do
        bar
      end end

    # good
    def some_method
      do_stuff
    end

    def do_this(x)
      baz.map { |b| b.this(x) }
    end

    def foo
      block do
        bar
      end
    end
