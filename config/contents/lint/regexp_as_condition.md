Checks for regexp literals used as `match-current-line`.
If a regexp literal is in condition, the regexp matches `$_` implicitly.

### Example:
    # bad
    if /foo/
      do_something
    end

    # good
    if /foo/ =~ $_
      do_something
    end