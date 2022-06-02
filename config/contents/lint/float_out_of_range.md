Identifies Float literals which are, like, really really really
really really really really really big. Too big. No-one needs Floats
that big. If you need a float that big, something is wrong with you.

### Example:

    # bad

    float = 3.0e400

### Example:

    # good

    float = 42.9