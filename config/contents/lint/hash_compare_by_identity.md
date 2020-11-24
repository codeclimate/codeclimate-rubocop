Prefer using `Hash#compare_by_identity` than using `object_id` for hash keys.

This cop is marked as unsafe as a hash possibly can contain other keys
besides `object_id`s.

### Example:
    # bad
    hash = {}
    hash[foo.object_id] = :bar
    hash.key?(baz.object_id)

    # good
    hash = {}.compare_by_identity
    hash[foo] = :bar
    hash.key?(baz)
