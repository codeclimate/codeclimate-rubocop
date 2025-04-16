Enforces the use of `$stdout/$stderr/$stdin` instead of `STDOUT/STDERR/STDIN`.
`STDOUT/STDERR/STDIN` are constants, and while you can actually
reassign (possibly to redirect some stream) constants in Ruby, you'll get
an interpreter warning if you do so.

Additionally, `$stdout/$stderr/$stdin` can safely be accessed in a Ractor because they
are ractor-local, while `STDOUT/STDERR/STDIN` will raise `Ractor::IsolationError`.

### Safety:

Autocorrection is unsafe because `STDOUT` and `$stdout` may point to different
objects, for example.

### Example:
    # bad
    STDOUT.puts('hello')

    hash = { out: STDOUT, key: value }

    def m(out = STDOUT)
      out.puts('hello')
    end

    # good
    $stdout.puts('hello')

    hash = { out: $stdout, key: value }

    def m(out = $stdout)
      out.puts('hello')
    end
