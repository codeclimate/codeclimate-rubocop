This cop is used to identify instances of sorting and then taking
only the first or last element.

### Example:
    # bad
    [].sort.first
    [].sort_by(&:length).last

    # good
    [].min
    [].max_by(&:length)