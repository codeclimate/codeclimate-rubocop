Checks for the presence of precise comparison of floating point numbers.

Floating point values are inherently inaccurate, and comparing them for exact equality
is almost never the desired semantics. Comparison via the `==/!=` operators checks
floating-point value representation to be exactly the same, which is very unlikely
if you perform any arithmetic operations involving precision loss.

### Example:
    # bad
    x == 0.1
    x != 0.1

    # good - using BigDecimal
    x.to_d == 0.1.to_d

 # good - comparing against zero
    x == 0.0
    x != 0.0

    # good
    (x - 0.1).abs < Float::EPSILON

    # good
    tolerance = 0.0001
    (x - 0.1).abs < tolerance

    # Or some other epsilon based type of comparison:
    # https://www.embeddeduse.com/2019/08/26/qt-compare-two-floats/
