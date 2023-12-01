Checks for cases when you could use a block
accepting version of a method that does automatic
resource cleanup.

### Example:

    # bad
    f = File.open('file')

    # good
    File.open('file') do |f|
      # ...
    end

    # bad
    f = Tempfile.open('temp')

    # good
    Tempfile.open('temp') do |f|
      # ...
    end