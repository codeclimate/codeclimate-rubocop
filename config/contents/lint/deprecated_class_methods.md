This cop checks for uses of the deprecated class method usages.

### Example:

    # bad

    File.exists?(some_path)

### Example:

    # good

    File.exist?(some_path)