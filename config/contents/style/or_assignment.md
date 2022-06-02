Checks for potential usage of the `||=` operator.

### Example:
    # bad
    name = name ? name : 'Bozhidar'

    # bad
    name = if name
             name
           else
             'Bozhidar'
           end

    # bad
    unless name
      name = 'Bozhidar'
    end

    # bad
    name = 'Bozhidar' unless name

    # good - set name to 'Bozhidar', only if it's nil or false
    name ||= 'Bozhidar'