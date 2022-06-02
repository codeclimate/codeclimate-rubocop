Enforces the use of consistent method names
from the String class.

### Example:
    # bad
    'name'.intern
    'var'.unfavored_method

    # good
    'name'.to_sym
    'var'.preferred_method