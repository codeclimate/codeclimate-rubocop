This cop checks for the use of Time methods without zone.

Built on top of Ruby on Rails style guide (https://github.com/bbatsov/rails-style-guide#time)
and the article http://danilenko.org/2012/7/6/rails_timezones/ .

Two styles are supported for this cop. When EnforcedStyle is 'strict'
then only use of Time.zone is allowed.

When EnforcedStyle is 'flexible' then it's also allowed
to use Time.in_time_zone.

### Example:
    # always offense
    Time.now
    Time.parse('2015-03-02 19:05:37')

    # no offense
    Time.zone.now
    Time.zone.parse('2015-03-02 19:05:37')

    # no offense only if style is 'flexible'
    Time.current
    DateTime.strptime(str, "%Y-%m-%d %H:%M %Z").in_time_zone
    Time.at(timestamp).in_time_zone