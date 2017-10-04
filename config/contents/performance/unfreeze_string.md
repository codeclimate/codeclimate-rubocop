In Ruby 2.3 or later, use unary plus operator to unfreeze a string
literal instead of `String#dup` and `String.new`.
Unary plus operator is faster than `String#dup`.

Note: `String.new` (without operator) is not exactly the same as `+''`.
These differ in encoding. `String.new.encoding` is always `ASCII-8BIT`.
However, `(+'').encoding` is the same as script encoding(e.g. `UTF-8`).
So, if you expect `ASCII-8BIT` encoding, disable this cop.

### Example:
    # bad
    ''.dup
    "something".dup
    String.new
    String.new('')
    String.new('something')

    # good
    +'something'
    +''