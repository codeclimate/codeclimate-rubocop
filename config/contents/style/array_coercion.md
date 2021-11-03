This cop enforces the use of `Array()` instead of explicit `Array` check or `[*var]`.

The cop is disabled by default due to safety concerns.

### Safety:

This cop is unsafe because a false positive may occur if
the argument of `Array()` is (or could be) nil or depending
on how the argument is handled by `Array()` (which can be
different than just wrapping the argument in an array).

For example:

```ruby
[nil]             #=> [nil]
Array(nil)        #=> []

[{a: 'b'}]        #= [{a: 'b'}]
Array({a: 'b'})   #=> [[:a, 'b']]

[Time.now]        #=> [#<Time ...>]
Array(Time.now)   #=> [14, 16, 14, 16, 9, 2021, 4, 259, true, "EDT"]
```

### Example:
    # bad
    paths = [paths] unless paths.is_a?(Array)
    paths.each { |path| do_something(path) }

    # bad (always creates a new Array instance)
    [*paths].each { |path| do_something(path) }

    # good (and a bit more readable)
    Array(paths).each { |path| do_something(path) }
