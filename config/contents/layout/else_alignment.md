Checks the alignment of else keywords. Normally they should
be aligned with an if/unless/while/until/begin/def/rescue keyword, but there
are special cases when they should follow the same rules as the
alignment of end.

### Example:
    # bad
    if something
      code
     else
      code
    end

    # bad
    if something
      code
     elsif something
      code
    end

    # good
    if something
      code
    else
      code
    end