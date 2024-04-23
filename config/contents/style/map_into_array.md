Checks for usages of `each` with `<<`, `push`, or `append` which
can be replaced by `map`.

If `PreferredMethods` is configured for `map` in `Style/CollectionMethods`,
this cop uses the specified method for replacement.

NOTE: The return value of `Enumerable#each` is `self`, whereas the
return value of `Enumerable#map` is an `Array`. They are not autocorrected
when a return value could be used because these types differ.

NOTE: It only detects when the mapping destination is a local variable
initialized as an empty array and referred to only by the pushing operation.
This is because, if not, it's challenging to statically guarantee that the
mapping destination variable remains an empty array:

```ruby
ret = []
src.each { |e| ret << e * 2 } # `<<` method may mutate `ret`

dest = []
src.each { |e| dest << transform(e, dest) } # `transform` method may mutate `dest`
```

### Safety:

This cop is unsafe because not all objects that have an `each`
method also have a `map` method (e.g. `ENV`). Additionally, for calls
with a block, not all objects that have a `map` method return an array
(e.g. `Enumerator::Lazy`).

### Example:
    # bad
    dest = []
    src.each { |e| dest << e * 2 }
    dest

    # good
    dest = src.map { |e| e * 2 }

    # good - contains another operation
    dest = []
    src.each { |e| dest << e * 2; puts e }
    dest
