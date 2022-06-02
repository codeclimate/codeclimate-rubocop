Checks for numbered parameters.

It can either restrict the use of numbered parameters to
single-lined blocks, or disallow completely numbered parameters.

### Example: EnforcedStyle: allow_single_line (default)
    # bad
    collection.each do
      puts _1
    end

    # good
    collection.each { puts _1 }

### Example: EnforcedStyle: disallow
    # bad
    collection.each { puts _1 }

    # good
    collection.each { |item| puts item }
