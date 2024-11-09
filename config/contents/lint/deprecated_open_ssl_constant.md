Algorithmic constants for `OpenSSL::Cipher` and `OpenSSL::Digest`
deprecated since OpenSSL version 2.2.0. Prefer passing a string
instead.

### Example:

    # bad
    OpenSSL::Cipher::AES.new(128, :GCM)

    # good
    OpenSSL::Cipher.new('aes-128-gcm')

    # bad
    OpenSSL::Digest::SHA256.new

    # good
    OpenSSL::Digest.new('SHA256')

    # bad
    OpenSSL::Digest::SHA256.digest('foo')

    # good
    OpenSSL::Digest.digest('SHA256', 'foo')
