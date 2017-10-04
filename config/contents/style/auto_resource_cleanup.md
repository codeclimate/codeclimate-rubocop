This cop checks for cases when you could use a block
accepting version of a method that does automatic
resource cleanup.

### Example:

    # bad
    f = File.open('file')

    # good
    File.open('file') do |f|
      ...
    end