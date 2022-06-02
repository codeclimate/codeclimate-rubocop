Checks for uses of `fail` and `raise`.

### Example: EnforcedStyle: only_raise (default)
    # The `only_raise` style enforces the sole use of `raise`.
    # bad
    begin
      fail
    rescue Exception
      # handle it
    end

    def watch_out
      fail
    rescue Exception
      # handle it
    end

    Kernel.fail

    # good
    begin
      raise
    rescue Exception
      # handle it
    end

    def watch_out
      raise
    rescue Exception
      # handle it
    end

    Kernel.raise

### Example: EnforcedStyle: only_fail
    # The `only_fail` style enforces the sole use of `fail`.
    # bad
    begin
      raise
    rescue Exception
      # handle it
    end

    def watch_out
      raise
    rescue Exception
      # handle it
    end

    Kernel.raise

    # good
    begin
      fail
    rescue Exception
      # handle it
    end

    def watch_out
      fail
    rescue Exception
      # handle it
    end

    Kernel.fail

### Example: EnforcedStyle: semantic
    # The `semantic` style enforces the use of `fail` to signal an
    # exception, then will use `raise` to trigger an offense after
    # it has been rescued.
    # bad
    begin
      raise
    rescue Exception
      # handle it
    end

    def watch_out
      # Error thrown
    rescue Exception
      fail
    end

    Kernel.fail
    Kernel.raise

    # good
    begin
      fail
    rescue Exception
      # handle it
    end

    def watch_out
      fail
    rescue Exception
      raise 'Preferably with descriptive message'
    end

    explicit_receiver.fail
    explicit_receiver.raise