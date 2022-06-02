Checks for top level return with arguments. If there is a
top-level return statement with an argument, then the argument is
always ignored. This is detected automatically since Ruby 2.7.

### Example:

    # Detected since Ruby 2.7
    return 1 # 1 is always ignored.