Algorithmic constants for `OpenSSL::Cipher` and `OpenSSL::Digest`
deprecated since OpenSSL version 2.2.0. Prefer passing a string
instead.

### Example:

    # Example for OpenSSL::Cipher instantiation.

    # bad
    OpenSSL::Cipher::AES.new(128, :GCM)

    # good
    OpenSSL::Cipher.new('AES-128-GCM')

### Example:

    # Example for OpenSSL::Digest instantiation.

    # bad
    OpenSSL::Digest::SHA256.new

    # good
    OpenSSL::Digest.new('SHA256')

### Example:

    # Example for ::Digest inherited class methods.

    # bad
    OpenSSL::Digest::SHA256.digest('foo')

    # good
    OpenSSL::Digest.digest('SHA256', 'foo')
