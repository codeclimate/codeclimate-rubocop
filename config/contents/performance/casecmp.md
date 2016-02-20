This cop identifies places where a case-insensitive string comparison
can better be implemented using `casecmp`.

### Example:
    # bad
    'aBc'.downcase == 'abc'
    'abc'.upcase.eql? 'ABC'
    'abc' == 'ABC'.downcase
    'ABC'.eql? 'abc'.upcase
    'abc'.downcase == 'abc'.downcase

    # good
    'aBc'.casecmp('ABC').zero?
    'abc'.casecmp('abc').zero?
    'abc'.casecmp('ABC'.downcase).zero?