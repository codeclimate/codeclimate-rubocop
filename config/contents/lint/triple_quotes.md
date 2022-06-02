Checks for "triple quotes" (strings delimited by any odd number
of quotes greater than 1).

Ruby allows multiple strings to be implicitly concatenated by just
being adjacent in a statement (ie. `"foo""bar" == "foobar"`). This sometimes
gives the impression that there is something special about triple quotes, but
in fact it is just extra unnecessary quotes and produces the same string. Each
pair of quotes produces an additional concatenated empty string, so the result
is still only the "actual" string within the delimiters.

NOTE: Although this cop is called triple quotes, the same behavior is present
for strings delimited by 5, 7, etc. quotation marks.

### Example:
    # bad
    """
      A string
    """

    # bad
    '''
      A string
    '''

    # good
    "
      A string
    "

    # good
    <<STRING
      A string
    STRING

    # good (but not the same spacing as the bad case)
    'A string'