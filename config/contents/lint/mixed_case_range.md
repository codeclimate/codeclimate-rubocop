Checks for mixed-case character ranges since they include likely unintended characters.

Offenses are registered for regexp character classes like `/[A-z]/`
as well as range objects like `('A'..'z')`.

NOTE: Range objects cannot be autocorrected.

### Safety:

The cop autocorrects regexp character classes
by replacing one character range with two: `A-z` becomes `A-Za-z`.
In most cases this is probably what was originally intended
but it changes the regexp to no longer match symbols it used to include.
For this reason, this cop's autocorrect is unsafe (it will
change the behavior of the code).

### Example:

    # bad
    r = /[A-z]/

    # good
    r = /[A-Za-z]/