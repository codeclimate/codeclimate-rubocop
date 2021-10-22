Prefer using `Hash#compare_by_identity` rather than using `object_id`
for hash keys.

This cop looks for hashes being keyed by objects' `object_id`, using
one of these methods: `key?`, `has_key?`, `fetch`, `[]` and `[]=`.

### Safety:

This cop is unsafe. Although unlikely, the hash could store both object
ids and other values that need be compared by value, and thus
could be a false positive.

Furthermore, this cop cannot guarantee that the receiver of one of the
methods (`key?`, etc.) is actually a hash.

### Example:
    # bad
    hash = {}
    hash[foo.object_id] = :bar
    hash.key?(baz.object_id)

    # good
    hash = {}.compare_by_identity
    hash[foo] = :bar
    hash.key?(baz)
