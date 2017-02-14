This cop is used to identify usages of file path joining process
to use `Rails.root.join` clause.

### Example:
 # bad
 Rails.root.join('app/models/goober')
 File.join(Rails.root, 'app/models/goober')
 "#{Rails.root}/app/models/goober"

 # good
 Rails.root.join('app', 'models', 'goober')