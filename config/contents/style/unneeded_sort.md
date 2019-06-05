This cop is used to identify instances of sorting and then
taking only the first or last element. The same behavior can
be accomplished without a relatively expensive sort by using
`Enumerable#min` instead of sorting and taking the first
element and `Enumerable#max` instead of sorting and taking the
last element. Similarly, `Enumerable#min_by` and
`Enumerable#max_by` can replace `Enumerable#sort_by` calls
after which only the first or last element is used.

### Example:
    # bad
    [2, 1, 3].sort.first
    [2, 1, 3].sort[0]
    [2, 1, 3].sort.at(0)
    [2, 1, 3].sort.slice(0)

    # good
    [2, 1, 3].min

    # bad
    [2, 1, 3].sort.last
    [2, 1, 3].sort[-1]
    [2, 1, 3].sort.at(-1)
    [2, 1, 3].sort.slice(-1)

    # good
    [2, 1, 3].max

    # bad
    arr.sort_by(&:foo).first
    arr.sort_by(&:foo)[0]
    arr.sort_by(&:foo).at(0)
    arr.sort_by(&:foo).slice(0)

    # good
    arr.min_by(&:foo)

    # bad
    arr.sort_by(&:foo).last
    arr.sort_by(&:foo)[-1]
    arr.sort_by(&:foo).at(-1)
    arr.sort_by(&:foo).slice(-1)

    # good
    arr.max_by(&:foo)
