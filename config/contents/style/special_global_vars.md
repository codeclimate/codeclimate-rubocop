
This cop looks for uses of Perl-style global variables.

### Example: EnforcedStyle: use_english_names (default)
    # good
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
    puts $MATCH
    puts $PREMATCH
    puts $POSTMATCH
    puts $LAST_PAREN_MATCH

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
    puts $&
    puts $`
    puts $'
    puts $+
