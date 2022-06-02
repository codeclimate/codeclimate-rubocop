Checks for unneeded usages of splat expansion

### Example:

    # bad
    a = *[1, 2, 3]
    a = *'a'
    a = *1
    ['a', 'b', *%w(c d e), 'f', 'g']

    # good
    c = [1, 2, 3]
    a = *c
    a, b = *c
    a, *b = *c
    a = *1..10
    a = ['a']
    ['a', 'b', 'c', 'd', 'e', 'f', 'g']

    # bad
    do_something(*['foo', 'bar', 'baz'])

    # good
    do_something('foo', 'bar', 'baz')

    # bad
    begin
      foo
    rescue *[StandardError, ApplicationError]
      bar
    end

    # good
    begin
      foo
    rescue StandardError, ApplicationError
      bar
    end

    # bad
    case foo
    when *[1, 2, 3]
      bar
    else
      baz
    end

    # good
    case foo
    when 1, 2, 3
      bar
    else
      baz
    end

### Example: AllowPercentLiteralArrayArgument: true (default)

    # good
    do_something(*%w[foo bar baz])

### Example: AllowPercentLiteralArrayArgument: false

    # bad
    do_something(*%w[foo bar baz])
