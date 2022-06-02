Checks for hardcoded IP addresses, which can make code
brittle. IP addresses are likely to need to be changed when code
is deployed to a different server or environment, which may break
a deployment if forgotten. Prefer setting IP addresses in ENV or
other configuration.

### Example:

    # bad
    ip_address = '127.59.241.29'

    # good
    ip_address = ENV['DEPLOYMENT_IP_ADDRESS']