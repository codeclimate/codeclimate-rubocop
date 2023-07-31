Prefer `equal?` over `==` when comparing `object_id`.

`Object#equal?` is provided to compare objects for identity, and in contrast
`Object#==` is provided for the purpose of doing value comparison.

### Example:
    # bad
    foo.object_id == bar.object_id

    # good
    foo.equal?(bar)
