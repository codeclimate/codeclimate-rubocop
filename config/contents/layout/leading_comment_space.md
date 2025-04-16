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

### Example: AllowRBSInlineAnnotation: false (default)

    # bad

    include Enumerable #[Integer]

    attr_reader :name #: String
    attr_reader :age  #: Integer?

### Example: AllowRBSInlineAnnotation: true

    # good

    include Enumerable #[Integer]

    attr_reader :name #: String
    attr_reader :age  #: Integer?

### Example: AllowSteepAnnotation: false (default)

    # bad
    [1, 2, 3].each_with_object([]) do |n, list| #$ Array[Integer]
      list << n
    end

    name = 'John'      #: String

### Example: AllowSteepAnnotation: true

    # good

    [1, 2, 3].each_with_object([]) do |n, list| #$ Array[Integer]
      list << n
    end

    name = 'John'      #: String
