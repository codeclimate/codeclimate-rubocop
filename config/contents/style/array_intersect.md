In Ruby 3.1, `Array#intersect?` has been added.

This cop identifies places where `(array1 & array2).any?`
or `(array1.intersection(array2)).any?` can be replaced by
`array1.intersect?(array2)`.

The `array1.intersect?(array2)` method is faster than
`(array1 & array2).any?` and is more readable.

In cases like the following, compatibility is not ensured,
so it will not be detected when using block argument.

```ruby
([1] & [1,2]).any? { |x| false }    # => false
[1].intersect?([1,2]) { |x| false } # => true
```

NOTE: Although `Array#intersection` can take zero or multiple arguments,
only cases where exactly one argument is provided can be replaced with
`Array#intersect?` and are handled by this cop.

### Safety:

This cop cannot guarantee that `array1` and `array2` are
actually arrays while method `intersect?` is for arrays only.

### Example:
    # bad
    (array1 & array2).any?
    (array1 & array2).empty?
    (array1 & array2).none?

    # bad
    array1.intersection(array2).any?
    array1.intersection(array2).empty?
    array1.intersection(array2).none?

    # good
    array1.intersect?(array2)
    !array1.intersect?(array2)

### Example: AllCops:ActiveSupportExtensionsEnabled: false (default)
    # good
    (array1 & array2).present?
    (array1 & array2).blank?

### Example: AllCops:ActiveSupportExtensionsEnabled: true
    # bad
    (array1 & array2).present?
    (array1 & array2).blank?

    # good
    array1.intersect?(array2)
    !array1.intersect?(array2)