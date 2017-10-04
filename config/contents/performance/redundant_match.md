This cop identifies use of `Regexp#match` or `String#match` in a context
where the integral return value of `=~` would do just as well.

### Example:
    # bad
    do_something if str.match(/regex/)
    while regex.match('str')
      do_something
    end

    # good
    method(str.match(/regex/))
    return regex.match('str')