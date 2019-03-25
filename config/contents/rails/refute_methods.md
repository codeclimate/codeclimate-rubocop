
Use `assert_not` methods instead of `refute` methods.

### Example:
    # bad
    refute false
    refute_empty [1, 2, 3]
    refute_equal true, false

    # good
    assert_not false
    assert_not_empty [1, 2, 3]
    assert_not_equal true, false
