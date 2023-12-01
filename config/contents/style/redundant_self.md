Checks for redundant uses of `self`.

The usage of `self` is only needed when:

* Sending a message to same object with zero arguments in
    presence of a method name clash with an argument or a local
    variable.

* Calling an attribute writer to prevent a local variable assignment.

Note, with using explicit self you can only send messages with public or
protected scope, you cannot send private messages this way.

Note we allow uses of `self` with operators because it would be awkward
otherwise. Also allows the use of `self.it` without arguments in blocks,
as in `0.times { self.it }`, following `Lint/ItWithoutArgumentsInBlock` cop.

### Example:

    # bad
    def foo(bar)
      self.baz
    end

    # good
    def foo(bar)
      self.bar  # Resolves name clash with the argument.
    end

    def foo
      bar = 1
      self.bar  # Resolves name clash with the local variable.
    end

    def foo
      %w[x y z].select do |bar|
        self.bar == bar  # Resolves name clash with argument of the block.
      end
    end