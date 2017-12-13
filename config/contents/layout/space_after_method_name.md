Checks for space between a method name and a left parenthesis in defs.

### Example:

    # bad
    def func (x) end
    def method= (y) end

    # good
    def func(x) end
    def method=(y) end