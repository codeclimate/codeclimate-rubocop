Checks for the use of Marshal class methods which have
potential security issues leading to remote code execution when
loading from an untrusted source.

### Example:
    # bad
    Marshal.load("{}")
    Marshal.restore("{}")

    # good
    Marshal.dump("{}")

    # okish - deep copy hack
    Marshal.load(Marshal.dump({}))
