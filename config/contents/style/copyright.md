Check that a copyright notice was given in each source file.

The default regexp for an acceptable copyright notice can be found in
config/default.yml.  The default can be changed as follows:

      Style/Copyright:
        Notice: '^Copyright (\(c\) )?2\d{3} Acme Inc'

This regex string is treated as an unanchored regex.  For each file
that RuboCop scans, a comment that matches this regex must be found or
an offense is reported.
