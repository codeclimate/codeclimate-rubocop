Checks for redundant escapes inside Regexp literals.

### Example:
    # bad
    %r{foo\/bar}

    # good
    %r{foo/bar}

    # good
    /foo\/bar/

    # good
    %r/foo\/bar/

    # good
    %r!foo\!bar!

    # bad
    /a\-b/

    # good
    /a-b/

    # bad
    /[\+\-]\d/

    # good
    /[+\-]\d/