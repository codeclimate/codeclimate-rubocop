This cop checks for uses of methods `Hash#has_key?` and
`Hash#has_value?`, and suggests using `Hash#key?` and `Hash#value?` instead.

It is configurable to enforce the verbose method names, by using the
`EnforcedStyle: verbose` configuration.

### Safety:

This cop is unsafe because it cannot be guaranteed that the receiver
is a `Hash` or responds to the replacement methods.

### Example: EnforcedStyle: short (default)
 # bad
 Hash#has_key?
 Hash#has_value?

 # good
 Hash#key?
 Hash#value?

### Example: EnforcedStyle: verbose
 # bad
 Hash#key?
 Hash#value?

 # good
 Hash#has_key?
 Hash#has_value?