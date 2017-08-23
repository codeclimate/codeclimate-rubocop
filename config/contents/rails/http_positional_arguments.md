This cop is used to identify usages of http methods like `get`, `post`,
`put`, `patch` without the usage of keyword arguments in your tests and
change them to use keyword args.  This cop only applies to Rails >= 5 .
If you are not running Rails < 5 you should disable # the
Rails/HttpPositionalArguments cop or set your TargetRailsVersion in your
.rubocop.yml file to 4.0, etc.

### Example:
    # bad
    get :new, { user_id: 1}

    # good
    get :new, params: { user_id: 1 }