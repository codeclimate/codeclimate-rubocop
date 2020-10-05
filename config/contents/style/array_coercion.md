This cop enforces the use of `Array()` instead of explicit `Array` check or `[*var]`.

This cop is disabled by default because false positive will occur if
the argument of `Array()` is not an array (e.g. Hash, Set),
an array will be returned as an incompatibility result.

### Example:
    # bad
    paths = [paths] unless paths.is_a?(Array)
    paths.each { |path| do_something(path) }

    # bad (always creates a new Array instance)
    [*paths].each { |path| do_something(path) }

    # good (and a bit more readable)
    Array(paths).each { |path| do_something(path) }
