Checks for using Fixnum or Bignum constant.

### Example:

    # bad

    1.is_a?(Fixnum)
    1.is_a?(Bignum)

### Example:

    # good

    1.is_a?(Integer)