Checks that quotes inside string, symbol, and regexp interpolations
match the configured preference.

### Example: EnforcedStyle: single_quotes (default)
    # bad
    string = "Tests #{success ? "PASS" : "FAIL"}"
    symbol = :"Tests #{success ? "PASS" : "FAIL"}"
    heredoc = <<~TEXT
      Tests #{success ? "PASS" : "FAIL"}
    TEXT
    regexp = /Tests #{success ? "PASS" : "FAIL"}/

    # good
    string = "Tests #{success ? 'PASS' : 'FAIL'}"
    symbol = :"Tests #{success ? 'PASS' : 'FAIL'}"
    heredoc = <<~TEXT
      Tests #{success ? 'PASS' : 'FAIL'}
    TEXT
    regexp = /Tests #{success ? 'PASS' : 'FAIL'}/

### Example: EnforcedStyle: double_quotes
    # bad
    string = "Tests #{success ? 'PASS' : 'FAIL'}"
    symbol = :"Tests #{success ? 'PASS' : 'FAIL'}"
    heredoc = <<~TEXT
      Tests #{success ? 'PASS' : 'FAIL'}
    TEXT
    regexp = /Tests #{success ? 'PASS' : 'FAIL'}/

    # good
    string = "Tests #{success ? "PASS" : "FAIL"}"
    symbol = :"Tests #{success ? "PASS" : "FAIL"}"
    heredoc = <<~TEXT
      Tests #{success ? "PASS" : "FAIL"}
    TEXT
    regexp = /Tests #{success ? "PASS" : "FAIL"}/