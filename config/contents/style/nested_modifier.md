Checks for nested use of if, unless, while and until in their
modifier form.

### Example:

    # bad
    something if a if b

    # good
    something if b && a