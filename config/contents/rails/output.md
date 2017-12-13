This cop checks for the use of output calls like puts and print

### Example:
    # bad
    puts 'A debug message'
    pp 'A debug message'
    print 'A debug message'

    # good
    Rails.logger.debug 'A debug message'