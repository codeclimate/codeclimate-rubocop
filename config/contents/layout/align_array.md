Here we check if the elements of a multi-line array literal are
aligned.

### Example:
    # bad
    a = [1, 2, 3,
      4, 5, 6]
    array = ['run',
         'forrest',
         'run']

    # good
    a = [1, 2, 3,
         4, 5, 6]
    a = ['run',
         'forrest',
         'run']