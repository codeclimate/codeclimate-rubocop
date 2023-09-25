Checks against comparing a variable with multiple items, where
`Array#include?`, `Set#include?` or a `case` could be used instead
to avoid code repetition.
It accepts comparisons of multiple method calls to avoid unnecessary method calls
by default. It can be configured by `AllowMethodComparison` option.

### Example:
    # bad
    a = 'a'
    foo if a == 'a' || a == 'b' || a == 'c'

    # good
    a = 'a'
    foo if ['a', 'b', 'c'].include?(a)

    VALUES = Set['a', 'b', 'c'].freeze
    # elsewhere...
    foo if VALUES.include?(a)

    case foo
    when 'a', 'b', 'c' then foo
    # ...
    end

    # accepted (but consider `case` as above)
    foo if a == b.lightweight || a == b.heavyweight

### Example: AllowMethodComparison: true (default)
    # good
    foo if a == b.lightweight || a == b.heavyweight

### Example: AllowMethodComparison: false
    # bad
    foo if a == b.lightweight || a == b.heavyweight

    # good
    foo if [b.lightweight, b.heavyweight].include?(a)

### Example: ComparisonsThreshold: 2 (default)
    # bad
    foo if a == 'a' || a == 'b'

### Example: ComparisonsThreshold: 3
    # good
    foo if a == 'a' || a == 'b'
