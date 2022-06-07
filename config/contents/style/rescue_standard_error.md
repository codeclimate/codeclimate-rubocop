Checks for rescuing `StandardError`. There are two supported
styles `implicit` and `explicit`. This cop will not register an offense
if any error other than `StandardError` is specified.

### Example: EnforcedStyle: explicit (default)
    # `explicit` will enforce using `rescue StandardError`
    # instead of `rescue`.

    # bad
    begin
      foo
    rescue
      bar
    end

    # good
    begin
      foo
    rescue StandardError
      bar
    end

    # good
    begin
      foo
    rescue OtherError
      bar
    end

    # good
    begin
      foo
    rescue StandardError, SecurityError
      bar
    end

### Example: EnforcedStyle: implicit
    # `implicit` will enforce using `rescue` instead of
    # `rescue StandardError`.

    # bad
    begin
      foo
    rescue StandardError
      bar
    end

    # good
    begin
      foo
    rescue
      bar
    end

    # good
    begin
      foo
    rescue OtherError
      bar
    end

    # good
    begin
      foo
    rescue StandardError, SecurityError
      bar
    end