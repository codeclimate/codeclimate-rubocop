Enforces using `//` or `%r` around regular expressions.

NOTE: The following `%r` cases using a regexp starts with a blank or `=`
as a method argument allowed to prevent syntax errors.

```ruby
do_something %r{ regexp} # `do_something / regexp/` is an invalid syntax.
do_something %r{=regexp} # `do_something /=regexp/` is an invalid syntax.
```

### Example: EnforcedStyle: slashes (default)
    # bad
    snake_case = %r{^[\dA-Z_]+$}

    # bad
    regex = %r{
      foo
      (bar)
      (baz)
    }x

    # good
    snake_case = /^[\dA-Z_]+$/

    # good
    regex = /
      foo
      (bar)
      (baz)
    /x

### Example: EnforcedStyle: percent_r
    # bad
    snake_case = /^[\dA-Z_]+$/

    # bad
    regex = /
      foo
      (bar)
      (baz)
    /x

    # good
    snake_case = %r{^[\dA-Z_]+$}

    # good
    regex = %r{
      foo
      (bar)
      (baz)
    }x

### Example: EnforcedStyle: mixed
    # bad
    snake_case = %r{^[\dA-Z_]+$}

    # bad
    regex = /
      foo
      (bar)
      (baz)
    /x

    # good
    snake_case = /^[\dA-Z_]+$/

    # good
    regex = %r{
      foo
      (bar)
      (baz)
    }x

### Example: AllowInnerSlashes: false (default)
    # If `false`, the cop will always recommend using `%r` if one or more
    # slashes are found in the regexp string.

    # bad
    x =~ /home\//

    # good
    x =~ %r{home/}

### Example: AllowInnerSlashes: true
    # good
    x =~ /home\//