Checks for uses of the deprecated class method usages.

### Example:

    # bad
    File.exists?(some_path)
    Dir.exists?(some_path)
    iterator?
    attr :name, true
    attr :name, false
    ENV.freeze # Calling `Env.freeze` raises `TypeError` since Ruby 2.7.
    ENV.clone
    ENV.dup # Calling `Env.dup` raises `TypeError` since Ruby 3.1.
    Socket.gethostbyname(host)
    Socket.gethostbyaddr(host)

    # good
    File.exist?(some_path)
    Dir.exist?(some_path)
    block_given?
    attr_accessor :name
    attr_reader :name
    ENV # `ENV.freeze` cannot prohibit changes to environment variables.
    ENV.to_h
    ENV.to_h # `ENV.dup` cannot dup `ENV`, use `ENV.to_h` to get a copy of `ENV` as a hash.
    Addrinfo.getaddrinfo(nodename, service)
    Addrinfo.tcp(host, port).getnameinfo