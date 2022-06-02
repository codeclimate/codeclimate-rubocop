Enforces the use of explicit block argument to avoid writing
block literal that just passes its arguments to another block.

NOTE: This cop only registers an offense if the block args match the
yield args exactly.

### Example:
    # bad
    def with_tmp_dir
      Dir.mktmpdir do |tmp_dir|
        Dir.chdir(tmp_dir) { |dir| yield dir } # block just passes arguments
      end
    end

    # bad
    def nine_times
      9.times { yield }
    end

    # good
    def with_tmp_dir(&block)
      Dir.mktmpdir do |tmp_dir|
        Dir.chdir(tmp_dir, &block)
      end
    end

    with_tmp_dir do |dir|
      puts "dir is accessible as a parameter and pwd is set: #{dir}"
    end

    # good
    def nine_times(&block)
      9.times(&block)
    end
