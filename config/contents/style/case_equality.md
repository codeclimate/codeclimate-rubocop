This cop checks for uses of the case equality operator(===).

If `AllowOnConstant` option is enabled, the cop will ignore violations when the receiver of
the case equality operator is a constant.

### Example:
    # bad
    (1..100) === 7
    /something/ === some_string

    # good
    something.is_a?(Array)
    (1..100).include?(7)
    /something/.match?(some_string)

### Example: AllowOnConstant: false (default)
    # bad
    Array === something

### Example: AllowOnConstant: true
    # good
    Array === something
