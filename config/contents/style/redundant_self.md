This cop checks for redundant uses of `self`.

`self` is only needed when:

* Sending a message to same object with zero arguments in
    presence of a method name clash with an argument or a local
    variable.

    Note, with using explicit self you can only send messages
    with public or protected scope, you cannot send private
    messages this way.

    Example:

    def bar
      :baz
    end

    def foo(bar)
      self.bar # resolves name clash with argument
    end

    def foo2
      bar = 1
      self.bar # resolves name clash with local variable
    end

    %w[x y z].select do |bar|
      self.bar == bar # resolves name clash with argument of a block
    end

* Calling an attribute writer to prevent an local variable assignment

    attr_writer :bar

    def foo
      self.bar= 1 # Make sure above attr writer is called
    end

Special cases:

We allow uses of `self` with operators because it would be awkward
otherwise.