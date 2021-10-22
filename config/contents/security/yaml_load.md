This cop checks for the use of YAML class methods which have
potential security issues leading to remote code execution when
loading from an untrusted source.

### Safety:

The behaviour of the code might change depending on what was
in the YAML payload, since `YAML.safe_load` is more restrictive.

### Example:
    # bad
    YAML.load("--- foo")

    # good
    YAML.safe_load("--- foo")
    YAML.dump("foo")
