`Dir[...]` and `Dir.glob(...)` do not make any guarantees about
the order in which files are returned. The final order is
determined by the operating system and file system.
This means that using them in cases where the order matters,
such as requiring files, can lead to intermittent failures
that are hard to debug. To ensure this doesn't happen,
always sort the list.

`Dir.glob` and `Dir[]` sort globbed results by default in Ruby 3.0.
So all bad cases are acceptable when Ruby 3.0 or higher are used.

NOTE: This cop will be deprecated and removed when supporting only Ruby 3.0 and higher.

### Safety:

This cop is unsafe in the case where sorting files changes existing
expected behaviour.

### Example:

    # bad
    Dir["./lib/**/*.rb"].each do |file|
      require file
    end

    # good
    Dir["./lib/**/*.rb"].sort.each do |file|
      require file
    end

    # bad
    Dir.glob(Rails.root.join(__dir__, 'test', '*.rb')) do |file|
      require file
    end

    # good
    Dir.glob(Rails.root.join(__dir__, 'test', '*.rb')).sort.each do |file|
      require file
    end

    # bad
    Dir['./lib/**/*.rb'].each(&method(:require))

    # good
    Dir['./lib/**/*.rb'].sort.each(&method(:require))

    # bad
    Dir.glob(Rails.root.join('test', '*.rb'), &method(:require))

    # good
    Dir.glob(Rails.root.join('test', '*.rb')).sort.each(&method(:require))

    # good - Respect intent if `sort` keyword option is specified in Ruby 3.0 or higher.
    Dir.glob(Rails.root.join(__dir__, 'test', '*.rb'), sort: false).each(&method(:require))
