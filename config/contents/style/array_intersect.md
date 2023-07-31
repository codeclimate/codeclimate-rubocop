In Ruby 3.1, `Array#intersect?` has been added.

This cop identifies places where `(array1 & array2).any?`
can be replaced by `array1.intersect?(array2)`.

The `array1.intersect?(array2)` method is faster than
`(array1 & array2).any?` and is more readable.

In cases like the following, compatibility is not ensured,
so it will not be detected when using block argument.

```ruby
([1] & [1,2]).any? { |x| false }    # => false
[1].intersect?([1,2]) { |x| false } # => true
```

### Safety:

This cop cannot guarantee that `array1` and `array2` are
actually arrays while method `intersect?` is for arrays only.

### Example:
    # bad
    (array1 & array2).any?
    (array1 & array2).empty?

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