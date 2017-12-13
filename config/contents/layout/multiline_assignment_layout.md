This cop checks whether the multiline assignments have a newline
after the assignment operator.

### Example: EnforcedStyle: new_line (default)
    # bad
    foo = if expression
      'bar'
    end

    # good
    foo =
      if expression
        'bar'
      end

    # good
    foo =
      begin
        compute
      rescue => e
        nil
      end

### Example: EnforcedStyle: same_line
    # good
    foo = if expression
      'bar'
    end