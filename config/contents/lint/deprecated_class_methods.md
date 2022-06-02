Checks for uses of the deprecated class method usages.

### Example:

    # bad

    File.exists?(some_path)
    Dir.exists?(some_path)
    iterator?
    ENV.freeze # Calling `Env.freeze` raises `TypeError` since Ruby 2.7.
    Socket.gethostbyname(host)
    Socket.gethostbyaddr(host)

### Example:

    # good

    File.exist?(some_path)
    Dir.exist?(some_path)
    block_given?
    ENV # `ENV.freeze` cannot prohibit changes to environment variables.
    Addrinfo.getaddrinfo(nodename, service)
    Addrinfo.tcp(host, port).getnameinfo