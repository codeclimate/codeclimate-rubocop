Sort globbed results by default in Ruby 3.0.
This cop checks for redundant `sort` method to `Dir.glob` and `Dir[]`.

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
