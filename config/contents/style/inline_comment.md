Checks for trailing inline comments.

### Example:

    # good
    foo.each do |f|
      # Standalone comment
      f.bar
    end

    # bad
    foo.each do |f|
      f.bar # Trailing inline comment
    end