Checks for the use of a method, the result of which
would be a literal, like an empty array, hash, or string.

### Example:
    # bad
    a = Array.new
    h = Hash.new
    s = String.new

    # good
    a = []
    h = {}
    s = ''