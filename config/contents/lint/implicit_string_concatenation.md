This cop checks for implicit string concatenation of string literals
which are on the same line.

### Example:
    # bad
    array = ['Item 1' 'Item 2']

    # good
    array = ['Item 1Item 2']
    array = ['Item 1' + 'Item 2']
    array = [
      'Item 1' \
      'Item 2'
    ]