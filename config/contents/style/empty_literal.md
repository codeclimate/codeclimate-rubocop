Checks for the use of a method, the result of which
would be a literal, like an empty array, hash, or string.

NOTE: When frozen string literals are enabled, `String.new`
isn't corrected to an empty string since the former is
mutable and the latter would be frozen.

### Example:
    # bad
    a = Array.new
    a = Array[]
    h = Hash.new
    h = Hash[]
    s = String.new

    # good
    a = []
    h = {}
    s = ''