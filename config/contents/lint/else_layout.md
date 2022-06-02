Checks for odd `else` block layout - like
having an expression on the same line as the `else` keyword,
which is usually a mistake.

Its autocorrection tweaks layout to keep the syntax. So, this autocorrection
is compatible correction for bad case syntax, but if your code makes a mistake
with `elsif` and `else`, you will have to correct it manually.

### Example:

    # bad

    if something
      # ...
    else do_this
      do_that
    end

### Example:

    # good

    # This code is compatible with the bad case. It will be autocorrected like this.
    if something
      # ...
    else
      do_this
      do_that
    end

    # This code is incompatible with the bad case.
    # If `do_this` is a condition, `elsif` should be used instead of `else`.
    if something
      # ...
    elsif do_this
      do_that
    end