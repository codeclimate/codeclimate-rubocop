Checks for the instantiation of regexp using redundant `Regexp.new` or `Regexp.compile`.
Autocorrect replaces to regexp literal which is the simplest and fastest.

### Example:

    # bad
    Regexp.new(/regexp/)
    Regexp.compile(/regexp/)

    # good
    /regexp/
    Regexp.new('regexp')
    Regexp.compile('regexp')
