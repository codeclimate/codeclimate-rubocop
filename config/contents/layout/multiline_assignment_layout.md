This cop checks whether the multiline assignments have a newline
after the assignment operator.

### Example:
    # bad (with EnforcedStyle set to new_line)
    foo = if expression
      'bar'
    end

    # good (with EnforcedStyle set to same_line)
    foo = if expression
      'bar'
    end

    # good (with EnforcedStyle set to new_line)
    foo =
      if expression
        'bar'
      end

    # good (with EnforcedStyle set to new_line)
    foo =
      begin
        compute
      rescue => e
        nil
      end