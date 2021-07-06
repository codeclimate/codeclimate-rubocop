This cop checks the indentation of the next line after a line that ends with a string
literal and a backslash.

If `EnforcedStyle: aligned` is set, the concatenated string parts shall be aligned with the
first part. There are some exceptions, such as implicit return values, where the
concatenated string parts shall be indented regardless of `EnforcedStyle` configuration.

If `EnforcedStyle: indented` is set, it's the second line that shall be indented one step
more than the first line. Lines 3 and forward shall be aligned with line 2. Here too there
are exceptions. Values in a hash literal are always aligned.

### Example:
    # bad
    def some_method
      'x' \
      'y' \
      'z'
    end

    my_hash = {
      first: 'a message' \
        'in two parts'
    }

    # good
    def some_method
      'x' \
        'y' \
        'z'
    end

    my_hash = {
      first: 'a message' \
             'in two parts'
    }

### Example: EnforcedStyle: aligned (default)
    # bad
    puts 'x' \
      'y'

    # good
    puts 'x' \
         'y'

### Example: EnforcedStyle: indented
    # bad
    result = 'x' \
             'y'

    # good
    result = 'x' \
      'y'
