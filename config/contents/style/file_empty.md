Prefer to use `File.empty?('path/to/file')` when checking if a file is empty.

### Safety:

This cop's autocorrection is unsafe it because `File.size`, `File.read`,
and `File.binread` raise `ENOENT` exception when there is no file
corresponding to the path, while `File.empty?` does not raise an exception.

### Example:
    # bad
    File.zero?('path/to/file')
    File.size('path/to/file') == 0
    File.size('path/to/file') >= 0
    File.size('path/to/file').zero?
    File.read('path/to/file').empty?
    File.binread('path/to/file') == ''
    FileTest.zero?('path/to/file')

    # good
    File.empty?('path/to/file')
    FileTest.empty?('path/to/file')
