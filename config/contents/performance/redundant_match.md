This cop identifies the use of `Regexp#match` or `String#match`, which
returns `#<MatchData>`/`nil`. The return value of `=~` is an integral
index/`nil` and is more performant.

### Example:
    # bad
    do_something if str.match(/regex/)
    while regex.match('str')
      do_something
    end

    # good
    method(str =~ /regex/)
    return value unless regex =~ 'str'