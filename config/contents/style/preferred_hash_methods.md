This cop (by default) checks for uses of methods Hash#has_key? and
Hash#has_value? where it enforces Hash#key? and Hash#value?
It is configurable to enforce the inverse, using `verbose` method
names also.

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