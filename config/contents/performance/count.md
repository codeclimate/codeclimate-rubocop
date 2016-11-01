This cop is used to identify usages of `count` on an `Enumerable` that
follow calls to `select` or `reject`. Querying logic can instead be
passed to the `count` call.

### Example:
    # bad
    [1, 2, 3].select { |e| e > 2 }.size
    [1, 2, 3].reject { |e| e > 2 }.size
    [1, 2, 3].select { |e| e > 2 }.length
    [1, 2, 3].reject { |e| e > 2 }.length
    [1, 2, 3].select { |e| e > 2 }.count { |e| e.odd? }
    [1, 2, 3].reject { |e| e > 2 }.count { |e| e.even? }
    array.select(&:value).count

    # good
    [1, 2, 3].count { |e| e > 2 }
    [1, 2, 3].count { |e| e < 2 }
    [1, 2, 3].count { |e| e > 2 && e.odd? }
    [1, 2, 3].count { |e| e < 2 && e.even? }
    Model.select('field AS field_one').count
    Model.select(:value).count

`ActiveRecord` compatibility:
`ActiveRecord` will ignore the block that is passed to `count`.
Other methods, such as `select`, will convert the association to an
array and then run the block on the array. A simple work around to
make `count` work with a block is to call `to_a.count {...}`.

Example:
    Model.where(id: [1, 2, 3].select { |m| m.method == true }.size

    becomes:

    Model.where(id: [1, 2, 3]).to_a.count { |m| m.method == true }