
This cop looks for uses of Perl-style global variables.
Correcting to global variables in the 'English' library
will add a require statement to the top of the file if
enabled by RequireEnglish config.

### Example: EnforcedStyle: use_english_names (default)
    # good
    require 'English' # or this could be in another file.

    puts $LOAD_PATH
    puts $LOADED_FEATURES
    puts $PROGRAM_NAME
    puts $ERROR_INFO
    puts $ERROR_POSITION
    puts $FIELD_SEPARATOR # or $FS
    puts $OUTPUT_FIELD_SEPARATOR # or $OFS
    puts $INPUT_RECORD_SEPARATOR # or $RS
    puts $OUTPUT_RECORD_SEPARATOR # or $ORS
    puts $INPUT_LINE_NUMBER # or $NR
    puts $LAST_READ_LINE
    puts $DEFAULT_OUTPUT
    puts $DEFAULT_INPUT
    puts $PROCESS_ID # or $PID
    puts $CHILD_STATUS
    puts $LAST_MATCH_INFO
    puts $IGNORECASE
    puts $ARGV # or ARGV

### Example: EnforcedStyle: use_perl_names
    # good
    puts $:
    puts $"
    puts $0
    puts $!
    puts $@
    puts $;
    puts $,
    puts $/
    puts $\
    puts $.
    puts $_
    puts $>
    puts $<
    puts $$
    puts $?
    puts $~
    puts $=
    puts $*
