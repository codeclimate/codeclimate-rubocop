This cop checks for invalid character literals with a non-escaped
whitespace character (e.g. `? `).
However, currently it's unclear whether there's a way to emit this
warning without syntax errors.

      $ ruby -w
      p(? )
      -:1: warning: invalid character syntax; use ?\s
      -:1: syntax error, unexpected '?', expecting ')'
      p(? )
         ^

### Example:

    # bad

    p(? )