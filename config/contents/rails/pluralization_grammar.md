This cop checks for correct grammar when using ActiveSupport's
core extensions to the numeric classes.

### Example:
    # bad
    3.day.ago
    1.months.ago

    # good
    3.days.ago
    1.month.ago