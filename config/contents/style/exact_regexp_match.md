Checks for exact regexp match inside Regexp literals.

### Example:

    # bad
    string =~ /\Astring\z/
    string === /\Astring\z/
    string.match(/\Astring\z/)
    string.match?(/\Astring\z/)

    # good
    string == 'string'

    # bad
    string !~ /\Astring\z/

    # good
    string != 'string'
