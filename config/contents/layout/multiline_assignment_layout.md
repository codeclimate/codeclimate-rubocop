Checks whether the multiline assignments have a newline
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

### Example: SupportedTypes: ['block', 'case', 'class', 'if', 'kwbegin', 'module'] (default)
    # good
    foo =
      if expression
        'bar'
      end

    # good
    foo =
      [1].map do |i|
        i + 1
      end

### Example: SupportedTypes: ['block']
    # good
    foo = if expression
      'bar'
    end

    # good
    foo =
      [1].map do |i|
        'bar' * i
      end
