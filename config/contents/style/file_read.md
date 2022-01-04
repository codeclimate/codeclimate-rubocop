Favor `File.(bin)read` convenience methods.

### Example:
    ## text mode
    # bad
    File.open(filename).read
    File.open(filename, &:read)
    File.open(filename) { |f| f.read }
    File.open(filename) do |f|
      f.read
    end
    File.open(filename, 'r').read
    File.open(filename, 'r', &:read)
    File.open(filename, 'r') do |f|
      f.read
    end

    # good
    File.read(filename)

### Example:
    ## binary mode
    # bad
    File.open(filename, 'rb').read
    File.open(filename, 'rb', &:read)
    File.open(filename, 'rb') do |f|
      f.read
    end

    # good
    File.binread(filename)
