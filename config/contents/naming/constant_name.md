Checks whether constant names are written using
SCREAMING_SNAKE_CASE.

To avoid false positives, it ignores cases in which we cannot know
for certain the type of value that would be assigned to a constant.

### Example:
    # bad
    InchInCm = 2.54
    INCHinCM = 2.54
    Inch_In_Cm = 2.54

    # good
    INCH_IN_CM = 2.54