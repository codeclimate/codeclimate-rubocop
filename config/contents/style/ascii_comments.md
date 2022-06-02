Checks for non-ascii (non-English) characters
in comments. You could set an array of allowed non-ascii chars in
`AllowedChars` attribute (copyright notice "©" by default).

### Example:
    # bad
    # Translates from English to 日本語。

    # good
    # Translates from English to Japanese