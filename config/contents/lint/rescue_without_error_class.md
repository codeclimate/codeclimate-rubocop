This cop checks for uses of `rescue` with no error class specified.

### Example:

    # good
    begin
      foo
    rescue BarError
      bar
    end

    # bad
    begin
      foo
    rescue
      bar
    end