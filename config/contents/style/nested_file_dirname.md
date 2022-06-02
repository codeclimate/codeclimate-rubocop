Checks for nested `File.dirname`.
It replaces nested `File.dirname` with the level argument introduced in Ruby 3.1.

### Example:

    # bad
    File.dirname(File.dirname(path))

    # good
    File.dirname(path, 2)
