Sort globbed results by default in Ruby 3.0.
This cop checks for redundant `sort` method to `Dir.glob` and `Dir[]`.

### Safety:

This cop is unsafe, in case of having a file and a directory with
identical names, since directory will be loaded before the file, which
will break `exe/files.rb` that rely on `exe.rb` file.

### Example:

    # bad
    Dir.glob('./lib/**/*.rb').sort.each do |file|
    end

    Dir['./lib/**/*.rb'].sort.each do |file|
    end

    # good
    Dir.glob('./lib/**/*.rb').each do |file|
    end

    Dir['./lib/**/*.rb'].each do |file|
    end
