This cop enforces using `` or %x around command literals.

### Example:
    # Good if EnforcedStyle is backticks or mixed, bad if percent_x.
    folders = `find . -type d`.split

    # Good if EnforcedStyle is percent_x, bad if backticks or mixed.
    folders = %x(find . -type d).split

    # Good if EnforcedStyle is backticks, bad if percent_x or mixed.
    `
      ln -s foo.example.yml foo.example
      ln -s bar.example.yml bar.example
    `

    # Good if EnforcedStyle is percent_x or mixed, bad if backticks.
    %x(
      ln -s foo.example.yml foo.example
      ln -s bar.example.yml bar.example
    )

    # Bad unless AllowInnerBackticks is true.
    `echo \`ls\``