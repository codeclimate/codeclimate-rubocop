Checks if usage of %() or %Q() matches configuration.

### Example: EnforcedStyle: bare_percent (default)
    # bad
    %Q(He said: "#{greeting}")
    %q{She said: 'Hi'}

    # good
    %(He said: "#{greeting}")
    %{She said: 'Hi'}

### Example: EnforcedStyle: percent_q
    # bad
    %|He said: "#{greeting}"|
    %/She said: 'Hi'/

    # good
    %Q|He said: "#{greeting}"|
    %q/She said: 'Hi'/
