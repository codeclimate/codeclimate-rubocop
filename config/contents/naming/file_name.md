This cop makes sure that Ruby source files have snake_case
names. Ruby scripts (i.e. source files with a shebang in the
first line) are ignored.

### Example:
    # bad
    lib/layoutManager.rb

    anything/usingCamelCase

    # good
    lib/layout_manager.rb

    anything/using_snake_case.rake