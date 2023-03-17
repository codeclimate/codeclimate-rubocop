Checks for deprecated constants.

It has `DeprecatedConstants` config. If there is an alternative method, you can set
alternative value as `Alternative`. And you can set the deprecated version as
`DeprecatedVersion`. These options can be omitted if they are not needed.

    DeprecatedConstants:
      'DEPRECATED_CONSTANT':
        Alternative: 'alternative_value'
        DeprecatedVersion: 'deprecated_version'

By default, `NIL`, `TRUE`, `FALSE`, `Net::HTTPServerException, `Random::DEFAULT`,
`Struct::Group`, and `Struct::Passwd` are configured.

### Example:

    # bad
    NIL
    TRUE
    FALSE
    Net::HTTPServerException
    Random::DEFAULT # Return value of Ruby 2 is `Random` instance, Ruby 3.0 is `Random` class.
    Struct::Group
    Struct::Passwd

    # good
    nil
    true
    false
    Net::HTTPClientException
    Random.new # `::DEFAULT` has been deprecated in Ruby 3, `.new` is compatible with Ruby 2.
    Etc::Group
    Etc::Passwd
