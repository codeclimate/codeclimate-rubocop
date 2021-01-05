This cop warns the usage of unsafe number conversions. Unsafe
number conversion can cause unexpected error if auto type conversion
fails. Cop prefer parsing with number class instead.

Conversion with `Integer`, `Float`, etc. will raise an `ArgumentError`
if given input that is not numeric (eg. an empty string), whereas
`to_i`, etc. will try to convert regardless of input (`''.to_i => 0`).
As such, this cop is disabled by default because it's not necessarily
always correct to raise if a value is not numeric.

NOTE: Some values cannot be converted properly using one of the `Kernel`
method (for instance, `Time` and `DateTime` values are allowed by this
cop by default). Similarly, Rails' duration methods do not work well
with `Integer()` and can be ignored with `IgnoredMethods`.

### Example:

    # bad

    '10'.to_i
    '10.2'.to_f
    '10'.to_c

    # good

    Integer('10', 10)
    Float('10.2')
    Complex('10')

### Example: IgnoredMethods: [minutes]

    # good
    10.minutes.to_i

### Example: IgnoredClasses: [Time, DateTime] (default)

    # good
    Time.now.to_datetime.to_i