Warns the usage of unsafe number conversions. Unsafe
number conversion can cause unexpected error if auto type conversion
fails. Cop prefer parsing with number class instead.

Conversion with `Integer`, `Float`, etc. will raise an `ArgumentError`
if given input that is not numeric (eg. an empty string), whereas
`to_i`, etc. will try to convert regardless of input (``''.to_i => 0``).
As such, this cop is disabled by default because it's not necessarily
always correct to raise if a value is not numeric.

NOTE: Some values cannot be converted properly using one of the `Kernel`
method (for instance, `Time` and `DateTime` values are allowed by this
cop by default). Similarly, Rails' duration methods do not work well
with `Integer()` and can be allowed with `AllowedMethods`. By default,
there are no methods to allowed.

### Safety:

Autocorrection is unsafe because it is not guaranteed that the
replacement `Kernel` methods are able to properly handle the
input if it is not a standard class.

### Example:

    # bad

    '10'.to_i
    '10.2'.to_f
    '10'.to_c
    '1/3'.to_r
    ['1', '2', '3'].map(&:to_i)
    foo.try(:to_f)
    bar.send(:to_c)

    # good

    Integer('10', 10)
    Float('10.2')
    Complex('10')
    Rational('1/3')
    ['1', '2', '3'].map { |i| Integer(i, 10) }
    foo.try { |i| Float(i) }
    bar.send { |i| Complex(i) }

### Example: AllowedMethods: [] (default)

    # bad
    10.minutes.to_i

### Example: AllowedMethods: [minutes]

    # good
    10.minutes.to_i

### Example: AllowedPatterns: [] (default)

    # bad
    10.minutes.to_i

### Example: AllowedPatterns: ['min*']

    # good
    10.minutes.to_i

### Example: IgnoredClasses: [Time, DateTime] (default)

    # good
    Time.now.to_datetime.to_i