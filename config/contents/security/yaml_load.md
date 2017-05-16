This cop checks for the use of YAML class methods which have
potential security issues leading to remote code execution when
loading from an untrusted source.

### Example:
    # bad
    YAML.load("--- foo")

    # good
    YAML.safe_load("--- foo")
    YAML.dump("foo")
