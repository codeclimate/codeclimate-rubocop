This cop identifies unnecessary use of a regex where `String#end_with?`
would suffice.

### Example:
    # bad
    'abc' =~ /bc\Z/
    'abc'.match(/bc\Z/)

    # good
    'abc'.end_with?('bc')