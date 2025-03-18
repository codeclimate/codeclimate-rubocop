Check that the elements of a multi-line array literal are
aligned.

### Example: EnforcedStyle: with_first_element (default)
    # good

    array = [1, 2, 3,
             4, 5, 6]
    array = ['run',
             'forrest',
             'run']

    # bad

    array = [1, 2, 3,
      4, 5, 6]
    array = ['run',
         'forrest',
         'run']

### Example: EnforcedStyle: with_fixed_indentation
    # good

    array = [1, 2, 3,
      4, 5, 6]

    # bad

    array = [1, 2, 3,
             4, 5, 6]