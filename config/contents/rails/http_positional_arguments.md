This cop is used to identify usages of http methods like `get`, `post`,
`put`, `patch` without the usage of keyword arguments in your tests and
change them to use keyword arguments.

### Example:
    # bad
    get :new, { user_id: 1}

    # good
    get :new, params: { user_id: 1 }