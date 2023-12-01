Identifies usages of `arr[0]` and `arr[-1]` and suggests to change
them to use `arr.first` and `arr.last` instead.

The cop is disabled by default due to safety concerns.

### Safety:

This cop is unsafe because `[0]` or `[-1]` can be called on a Hash,
which returns a value for `0` or `-1` key, but changing these to use
`.first` or `.last` will return first/last tuple instead. Also, String
does not implement `first`/`last` methods.

### Example:
    # bad
    arr[0]
    arr[-1]

    # good
    arr.first
    arr.last
    arr[0] = 2
    arr[0][-2]
