This cop identifies unnecessary use of a regex where
`String#start_with?` would suffice.

### Example:
    # bad
    'abc' =~ /\Aab/
    'abc'.match(/\Aab/)

    # good
    'abc'.start_with?('ab')