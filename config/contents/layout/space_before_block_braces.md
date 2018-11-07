Checks that block braces have or don't have a space before the opening
brace depending on configuration.

### Example:
    # bad
    foo.map{ |a|
      a.bar.to_s
    }

    # good
    foo.map { |a|
      a.bar.to_s
    }