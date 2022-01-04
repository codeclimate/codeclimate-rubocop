Favor `File.(bin)write` convenience methods.

### Example:
    ## text mode
    # bad
    File.open(filename, 'w').write(content)
    File.open(filename, 'w') do |f|
      f.write(content)
    end

    # good
    File.write(filename, content)

### Example:
    ## binary mode
    # bad
    File.open(filename, 'wb').write(content)
    File.open(filename, 'wb') do |f|
      f.write(content)
    end

    # good
    File.binwrite(filename, content)
