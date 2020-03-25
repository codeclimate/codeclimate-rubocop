This cop detects instances of rubocop:disable comments that can be
removed without causing any offenses to be reported. It's implemented
as a cop in that it inherits from the Cop base class and calls
add_offense. The unusual part of its implementation is that it doesn't
have any on_* methods or an investigate method. This means that it
doesn't take part in the investigation phase when the other cops do
their work. Instead, it waits until it's called in a later stage of the
execution. The reason it can't be implemented as a normal cop is that
it depends on the results of all other cops to do its work.


### Example:
    # bad
    # rubocop:disable Layout/LineLength
    x += 1
    # rubocop:enable Layout/LineLength

    # good
    x += 1