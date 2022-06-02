Checks whether the rescue and ensure keywords are aligned
properly.

### Example:

    # bad
    begin
      something
      rescue
      puts 'error'
    end

    # good
    begin
      something
    rescue
      puts 'error'
    end