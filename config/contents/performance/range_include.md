This cop identifies uses of `Range#include?`, which iterates over each
item in a `Range` to see if a specified item is there. In contrast,
`Range#cover?` simply compares the target item with the beginning and
end points of the `Range`. In a great majority of cases, this is what
is wanted.

This cop is `Safe: false` by default because `Range#include?` and
`Range#cover?` are not equivalent behaviour.

### Example:
    # bad
    ('a'..'z').include?('b') # => true

    # good
    ('a'..'z').cover?('b') # => true

    # Example of a case where `Range#cover?` may not provide
    # the desired result:

    ('a'..'z').cover?('yellow') # => true