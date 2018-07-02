This cop is used to identify usages of file path joining process
to use `Rails.root.join` clause. This is to avoid bugs on operating
system that don't use '/' as the path separator.

### Example:
 # bad
 Rails.root.join('app/models/goober')
 File.join(Rails.root, 'app/models/goober')
 "#{Rails.root}/app/models/goober"

 # good
 Rails.root.join('app', 'models', 'goober')