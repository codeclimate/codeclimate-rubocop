Checks whether comments have a leading space after the
`#` denoting the start of the comment. The leading space is not
required for some RDoc special syntax, like `#++`, `#--`,
`#:nodoc`, `=begin`- and `=end` comments, "shebang" directives,
or rackup options.

### Example:

    # bad
    #Some comment

    # good
    # Some comment

### Example: AllowDoxygenCommentStyle: false (default)

    # bad

    #**
    # Some comment
    # Another line of comment
    #*

### Example: AllowDoxygenCommentStyle: true

    # good

    #**
    # Some comment
    # Another line of comment
    #*

### Example: AllowGemfileRubyComment: false (default)

    # bad

    #ruby=2.7.0
    #ruby-gemset=myproject

### Example: AllowGemfileRubyComment: true

    # good

    #ruby=2.7.0
    #ruby-gemset=myproject
