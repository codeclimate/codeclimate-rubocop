Enforces using `` or %x around command literals.

### Example: EnforcedStyle: backticks (default)
    # bad
    folders = %x(find . -type d).split

    # bad
    %x(
      ln -s foo.example.yml foo.example
      ln -s bar.example.yml bar.example
    )

    # good
    folders = `find . -type d`.split

    # good
    `
      ln -s foo.example.yml foo.example
      ln -s bar.example.yml bar.example
    `

### Example: EnforcedStyle: mixed
    # bad
    folders = %x(find . -type d).split

    # bad
    `
      ln -s foo.example.yml foo.example
      ln -s bar.example.yml bar.example
    `

    # good
    folders = `find . -type d`.split

    # good
    %x(
      ln -s foo.example.yml foo.example
      ln -s bar.example.yml bar.example
    )

### Example: EnforcedStyle: percent_x
    # bad
    folders = `find . -type d`.split

    # bad
    `
      ln -s foo.example.yml foo.example
      ln -s bar.example.yml bar.example
    `

    # good
    folders = %x(find . -type d).split

    # good
    %x(
      ln -s foo.example.yml foo.example
      ln -s bar.example.yml bar.example
    )

### Example: AllowInnerBackticks: false (default)
    # If `false`, the cop will always recommend using `%x` if one or more
    # backticks are found in the command string.

    # bad
    `echo \`ls\``

    # good
    %x(echo `ls`)

### Example: AllowInnerBackticks: true
    # good
    `echo \`ls\``