Checks the spacing around the keywords.

### Example:

    # bad
    something 'test'do|x|
    end

    while(something)
    end

    something = 123if test

    # good
    something 'test' do |x|
    end

    while (something)
    end

    something = 123 if test