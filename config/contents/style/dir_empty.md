Prefer to use `Dir.empty?('path/to/dir')` when checking if a directory is empty.

### Example:
    # bad
    Dir.entries('path/to/dir').size == 2
    Dir.children('path/to/dir').empty?
    Dir.children('path/to/dir').size == 0
    Dir.each_child('path/to/dir').none?

    # good
    Dir.empty?('path/to/dir')
