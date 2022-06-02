Checks for extra/unnecessary whitespace.

### Example:

    # good if AllowForAlignment is true
    name      = "RuboCop"
    # Some comment and an empty line

    website  += "/rubocop/rubocop" unless cond
    puts        "rubocop"          if     debug

    # bad for any configuration
    set_app("RuboCop")
    website  = "https://github.com/rubocop/rubocop"

    # good only if AllowBeforeTrailingComments is true
    object.method(arg)  # this is a comment

    # good even if AllowBeforeTrailingComments is false or not set
    object.method(arg) # this is a comment

    # good with either AllowBeforeTrailingComments or AllowForAlignment
    object.method(arg)         # this is a comment
    another_object.method(arg) # this is another comment
    some_object.method(arg)    # this is some comment