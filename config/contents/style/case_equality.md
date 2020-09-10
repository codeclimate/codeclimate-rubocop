This cop checks for uses of the case equality operator(===).

### Example:
    # bad
    Array === something
    (1..100) === 7
    /something/ === some_string

    # good
    something.is_a?(Array)
    (1..100).include?(7)
    /something/.match?(some_string)

### Example: AllowOnConstant
    # Style/CaseEquality:
    #   AllowOnConstant: true

    # bad
    (1..100) === 7
    /something/ === some_string

    # good
    Array === something
    (1..100).include?(7)
    /something/.match?(some_string)
