Checks for octal, hex, binary, and decimal literals using
uppercase prefixes and corrects them to lowercase prefix
or no prefix (in case of decimals).

### Example: EnforcedOctalStyle: zero_with_o (default)
    # bad - missing octal prefix
    num = 01234

    # bad - uppercase prefix
    num = 0O1234
    num = 0X12AB
    num = 0B10101

    # bad - redundant decimal prefix
    num = 0D1234
    num = 0d1234

    # good
    num = 0o1234
    num = 0x12AB
    num = 0b10101
    num = 1234

### Example: EnforcedOctalStyle: zero_only
    # bad
    num = 0o1234
    num = 0O1234

    # good
    num = 01234