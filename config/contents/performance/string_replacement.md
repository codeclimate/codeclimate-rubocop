This cop identifies places where `gsub` can be replaced by
`tr` or `delete`.

### Example:
    # bad
    'abc'.gsub('b', 'd')
    'abc'.gsub('a', '')
    'abc'.gsub(/a/, 'd')
    'abc'.gsub!('a', 'd')

    # good
    'abc'.gsub(/.*/, 'a')
    'abc'.gsub(/a+/, 'd')
    'abc'.tr('b', 'd')
    'a b c'.delete(' ')