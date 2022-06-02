Checks for variable interpolation (like "#@ivar").

### Example:
    # bad
    "His name is #$name"
    /check #$pattern/
    "Let's go to the #@store"

    # good
    "His name is #{$name}"
    /check #{$pattern}/
    "Let's go to the #{@store}"