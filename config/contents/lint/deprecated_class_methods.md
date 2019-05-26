This cop checks for uses of the deprecated class method usages.

### Example:

    # bad

    File.exists?(some_path)
    Dir.exists?(some_path)
    iterator?

### Example:

    # good

    File.exist?(some_path)
    Dir.exist?(some_path)
    block_given?