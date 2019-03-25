This cop is used to identify usages of
### Example:
    # bad
    array = ["a", "b", "c"]
    array.compact.flatten.map { |x| x.downcase }

Each of these methods (`compact`, `flatten`, `map`) will generate a
new intermediate array that is promptly thrown away. Instead it is
faster to mutate when we know it's safe.

### Example:
    # good.
    array = ["a", "b", "c"]
    array.compact!
    array.flatten!
    array.map! { |x| x.downcase }
    array