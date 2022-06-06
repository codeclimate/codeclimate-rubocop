Looks for trailing blank lines and a final newline in the
source code.

### Example: EnforcedStyle: final_newline (default)
    # `final_newline` looks for one newline at the end of files.

    # bad
    class Foo; end

    # EOF

    # bad
    class Foo; end # EOF

    # good
    class Foo; end
    # EOF

### Example: EnforcedStyle: final_blank_line
    # `final_blank_line` looks for one blank line followed by a new line
    # at the end of files.

    # bad
    class Foo; end
    # EOF

    # bad
    class Foo; end # EOF

    # good
    class Foo; end

    # EOF
