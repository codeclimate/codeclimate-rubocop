This cop checks for octal, hex, binary and decimal literals using
uppercase prefixes and corrects them to lowercase prefix
or no prefix (in case of decimals).
eg. for octal use `0o` instead of `0` or `0O`.

Can be configured to use `0` only for octal literals using
`EnforcedOctalStyle` => `zero_only`