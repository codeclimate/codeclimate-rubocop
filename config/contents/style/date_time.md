This cop checks for consistent usage of the `DateTime` class over the
`Time` class. This cop is disabled by default since these classes,
although highly overlapping, have particularities that make them not
replaceable in certain situations when dealing with multiple timezones
and/or DST.

### Example:

    # bad - uses `DateTime` for current time
    DateTime.now

    # good - uses `Time` for current time
    Time.now

    # bad - uses `DateTime` for modern date
    DateTime.iso8601('2016-06-29')

    # good - uses `Time` for modern date
    Time.iso8601('2016-06-29')

    # good - uses `DateTime` with start argument for historical date
    DateTime.iso8601('1751-04-23', Date::ENGLAND)

### Example: AllowCoercion: false (default)

    # bad - coerces to `DateTime`
    something.to_datetime

    # good - coerces to `Time`
    something.to_time

### Example: AllowCoercion: true

    # good
    something.to_datetime

    # good
    something.to_time