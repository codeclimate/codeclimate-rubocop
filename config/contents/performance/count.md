This cop is used to identify usages of `count` on an
`Enumerable` and change them to `size`.

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