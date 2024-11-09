Certain numeric operations have a constant result, usually 0 or 1.
Multiplying a number by 0 will always return 0.
Dividing a number by itself or raising it to the power of 0 will always return 1.
As such, they can be replaced with that result.
These are probably leftover from debugging, or are mistakes.
Other numeric operations that are similarly leftover from debugging or mistakes
are handled by `Lint/UselessNumericOperation`.

NOTE: This cop doesn't detect offenses for the `-` and `%` operator because it
can't determine the type of `x`. If `x` is an `Array` or `String`, it doesn't perform
a numeric operation.

### Example:

    # bad
    x * 0

    # good
    0

    # bad
    x *= 0

    # good
    x = 0

    # bad
    x / x
    x ** 0

    # good
    1

    # bad
    x /= x
    x **= 0

    # good
    x = 1
