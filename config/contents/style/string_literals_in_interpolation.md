Checks that quotes inside the string interpolation
match the configured preference.

### Example: EnforcedStyle: single_quotes (default)
    # bad
    result = "Tests #{success ? "PASS" : "FAIL"}"

    # good
    result = "Tests #{success ? 'PASS' : 'FAIL'}"

### Example: EnforcedStyle: double_quotes
    # bad
    result = "Tests #{success ? 'PASS' : 'FAIL'}"

    # good
    result = "Tests #{success ? "PASS" : "FAIL"}"