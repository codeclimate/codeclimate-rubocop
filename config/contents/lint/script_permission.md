Checks if a file which has a shebang line as
its first line is granted execute permission.

### Example:
    # bad

    # A file which has a shebang line as its first line is not
    # granted execute permission.

    #!/usr/bin/env ruby
    puts 'hello, world'

    # good

    # A file which has a shebang line as its first line is
    # granted execute permission.

    #!/usr/bin/env ruby
    puts 'hello, world'

    # good

    # A file which has not a shebang line as its first line is not
    # granted execute permission.

    puts 'hello, world'
