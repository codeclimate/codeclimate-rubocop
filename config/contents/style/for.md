This cop looks for uses of the *for* keyword, or *each* method. The
preferred alternative is set in the EnforcedStyle configuration
parameter. An *each* call with a block on a single line is always
allowed, however.

### Example: EnforcedStyle: each (default)
    # bad
    def foo
      for n in [1, 2, 3] do
        puts n
      end
    end

    # good
    def foo
      [1, 2, 3].each do |n|
        puts n
      end
    end

### Example: EnforcedStyle: for
    # bad
    def foo
      [1, 2, 3].each do |n|
        puts n
      end
    end

    # good
    def foo
      for n in [1, 2, 3] do
        puts n
      end
    end
