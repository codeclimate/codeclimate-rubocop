Checks that braces used for hash literals have or don't have
surrounding space depending on configuration.

### Example: EnforcedStyle: space (default)
    # The `space` style enforces that hash literals have
    # surrounding space.

    # bad
    h = {a: 1, b: 2}

    # good
    h = { a: 1, b: 2 }

### Example: EnforcedStyle: no_space
    # The `no_space` style enforces that hash literals have
    # no surrounding space.

    # bad
    h = { a: 1, b: 2 }

    # good
    h = {a: 1, b: 2}

### Example: EnforcedStyle: compact
    # The `compact` style normally requires a space inside
    # hash braces, with the exception that successive left
    # braces or right braces are collapsed together in nested hashes.

    # bad
    h = { a: { b: 2 } }
    foo = { { a: 1 } => { b: { c: 2 } } }

    # good
    h = { a: { b: 2 }}
    foo = {{ a: 1 } => { b: { c: 2 }}}

### Example: EnforcedStyleForEmptyBraces: no_space (default)
    # The `no_space` EnforcedStyleForEmptyBraces style enforces that
    # empty hash braces do not contain spaces.

    # bad
    foo = { }
    bar = {    }
    baz = {
    }

    # good
    foo = {}
    bar = {}
    baz = {}

### Example: EnforcedStyleForEmptyBraces: space
    # The `space` EnforcedStyleForEmptyBraces style enforces that
    # empty hash braces contain space.

    # bad
    foo = {}

    # good
    foo = { }
    foo = {    }
    foo = {
    }
