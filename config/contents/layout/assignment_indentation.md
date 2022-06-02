Checks the indentation of the first line of the
right-hand-side of a multi-line assignment.

### Example:
    # bad
    value =
    if foo
      'bar'
    end

    # good
    value =
      if foo
        'bar'
      end

The indentation of the remaining lines can be corrected with
other cops such as `IndentationConsistency` and `EndAlignment`.