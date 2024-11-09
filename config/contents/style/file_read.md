Favor `File.(bin)read` convenience methods.

### Example:
    # bad - text mode
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

    # bad - binary mode
    File.open(filename, 'rb').read
    File.open(filename, 'rb', &:read)
    File.open(filename, 'rb') do |f|
      f.read
    end

    # good
    File.binread(filename)
