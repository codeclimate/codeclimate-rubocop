Checks for Windows-style line endings in the source code.

### Example: EnforcedStyle: native (default)
    # The `native` style means that CR+LF (Carriage Return + Line Feed) is
    # enforced on Windows, and LF is enforced on other platforms.

    # bad
    puts 'Hello' # Return character is LF on Windows.
    puts 'Hello' # Return character is CR+LF on other than Windows.

    # good
    puts 'Hello' # Return character is CR+LF on Windows.
    puts 'Hello' # Return character is LF on other than Windows.

### Example: EnforcedStyle: lf
    # The `lf` style means that LF (Line Feed) is enforced on
    # all platforms.

    # bad
    puts 'Hello' # Return character is CR+LF on all platforms.

    # good
    puts 'Hello' # Return character is LF on all platforms.

### Example: EnforcedStyle: crlf
    # The `crlf` style means that CR+LF (Carriage Return + Line Feed) is
    # enforced on all platforms.

    # bad
    puts 'Hello' # Return character is LF on all platforms.

    # good
    puts 'Hello' # Return character is CR+LF on all platforms.
