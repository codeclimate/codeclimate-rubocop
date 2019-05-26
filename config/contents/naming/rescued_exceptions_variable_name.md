This cop makes sure that rescued exceptions variables are named as
expected.

The `PreferredName` config option takes a `String`. It represents
the required name of the variable. Its default is `e`.

### Example: PreferredName: e (default)
    # bad
    begin
      # do something
    rescue MyException => exception
      # do something
    end

    # good
    begin
      # do something
    rescue MyException => e
      # do something
    end

    # good
    begin
      # do something
    rescue MyException => _e
      # do something
    end

### Example: PreferredName: exception
    # bad
    begin
      # do something
    rescue MyException => e
      # do something
    end

    # good
    begin
      # do something
    rescue MyException => exception
      # do something
    end

    # good
    begin
      # do something
    rescue MyException => _exception
      # do something
    end
