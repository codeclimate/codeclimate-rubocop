`Dir[...]` and `Dir.glob(...)` do not make any guarantees about
the order in which files are returned. The final order is
determined by the operating system and file system.
This means that using them in cases where the order matters,
such as requiring files, can lead to intermittent failures
that are hard to debug. To ensure this doesn't happen,
always sort the list.

### Example:

    # bad
    Dir["./lib/**/*.rb"].each do |file|
      require file
    end

    # good
    Dir["./lib/**/*.rb"].sort.each do |file|
      require file
    end

### Example:

    # bad
    Dir.glob(Rails.root.join(__dir__, 'test', '*.rb')) do |file|
      require file
    end

    # good
    Dir.glob(Rails.root.join(__dir__, 'test', '*.rb')).sort.each do |file|
      require file
    end
