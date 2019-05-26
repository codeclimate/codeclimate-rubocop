This cop is used to identify usages of file path joining process
to use `Rails.root.join` clause. It is used to add uniformity when
joining paths.

### Example: EnforcedStyle: arguments (default)
    # bad
    Rails.root.join('app/models/goober')
    File.join(Rails.root, 'app/models/goober')
    "#{Rails.root}/app/models/goober"

    # good
    Rails.root.join('app', 'models', 'goober')

### Example: EnforcedStyle: slashes
    # bad
    Rails.root.join('app', 'models', 'goober')
    File.join(Rails.root, 'app/models/goober')
    "#{Rails.root}/app/models/goober"

    # good
    Rails.root.join('app/models/goober')
