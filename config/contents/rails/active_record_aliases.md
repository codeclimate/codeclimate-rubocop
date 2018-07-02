Checks that ActiveRecord aliases are not used. The direct method names
are more clear and easier to read.

### Example:
    #bad
    Book.update_attributes!(author: 'Alice')

    #good
    Book.update!(author: 'Alice')