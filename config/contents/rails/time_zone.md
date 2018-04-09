This cop checks for the use of Time methods without zone.

Built on top of Ruby on Rails style guide (https://github.com/bbatsov/rails-style-guide#time)
and the article http://danilenko.org/2012/7/6/rails_timezones/ .

Two styles are supported for this cop. When EnforcedStyle is 'strict'
then only use of Time.zone is allowed.

When EnforcedStyle is 'flexible' then it's also allowed
to use Time.in_time_zone.

### Example: EnforcedStyle: strict
    # `strict` means that `Time` should be used with `zone`.

    # bad
    Time.now
    Time.parse('2015-03-02 19:05:37')

    # bad
    Time.current
    Time.at(timestamp).in_time_zone

    # good
    Time.zone.now
    Time.zone.parse('2015-03-02 19:05:37')

### Example: EnforcedStyle: flexible (default)
    # `flexible` allows usage of `in_time_zone` instead of `zone`.

    # bad
    Time.now
    Time.parse('2015-03-02 19:05:37')

    # good
    Time.zone.now
    Time.zone.parse('2015-03-02 19:05:37')

    # good
    Time.current
    Time.at(timestamp).in_time_zone