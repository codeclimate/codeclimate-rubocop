This cop enforces the consistent use of action filter methods.

The cop is configurable and can enforce the use of the older
something_filter methods or the newer something_action methods.

If the TargetRailsVersion is set to less than 4.0, the cop will enforce
the use of filter methods.

### Example: EnforcedStyle: action (default)
    # bad
    after_filter :do_stuff
    append_around_filter :do_stuff
    skip_after_filter :do_stuff

    # good
    after_action :do_stuff
    append_around_action :do_stuff
    skip_after_action :do_stuff

### Example: EnforcedStyle: filter
    # bad
    after_action :do_stuff
    append_around_action :do_stuff
    skip_after_action :do_stuff

    # good
    after_filter :do_stuff
    append_around_filter :do_stuff
    skip_after_filter :do_stuff