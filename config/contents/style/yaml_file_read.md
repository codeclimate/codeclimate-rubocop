Checks for the use of `YAML.load`, `YAML.safe_load`, and `YAML.parse` with
`File.read` argument.

NOTE: `YAML.safe_load_file` was introduced in Ruby 3.0.

### Example:

    # bad
    YAML.load(File.read(path))
    YAML.parse(File.read(path))

    # good
    YAML.load_file(path)
    YAML.parse_file(path)

    # bad
    YAML.safe_load(File.read(path)) # Ruby 3.0 and newer

    # good
    YAML.safe_load_file(path)       # Ruby 3.0 and newer
