This cop check for usages of not (`not` or `!`) called on a method
when an inverse of that method can be used instead.
Methods that can be inverted by a not (`not` or `!`) should be defined
in `InverseMethods`
Methods that are inverted by inverting the return
of the block that is passed to the method should be defined in
`InverseBlocks`

### Example:
    # bad
    !foo.none?
    !foo.any? { |f| f.even? }
    !foo.blank?
    !(foo == bar)
    foo.select { |f| !f.even? }
    foo.reject { |f| f != 7 }

    # good
    foo.none?
    foo.blank?
    foo.any? { |f| f.even? }
    foo != bar
    foo == bar
    !!('foo' =~ /^\w+$/)