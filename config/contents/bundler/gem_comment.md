Add a comment describing each gem in your Gemfile.

Optionally, the "OnlyFor" configuration
can be used to only register offenses when the gems
use certain options or have version specifiers.
Add "version_specifiers" and/or the gem option names
you want to check.

A useful use-case is to enforce a comment when using
options that change the source of a gem:

- `bitbucket`
- `gist`
- `git`
- `github`
- `source`

For a full list of options supported by bundler,
you can check the https://bundler.io/man/gemfile.5.html[official documentation].

### Example: OnlyFor: [] (default)
    # bad

    gem 'foo'

    # good

    # Helpers for the foo things.
    gem 'foo'

### Example: OnlyFor: ['version_specifiers']
    # bad

    gem 'foo', '< 2.1'

    # good

    # Version 2.1 introduces breaking change baz
    gem 'foo', '< 2.1'

### Example: OnlyFor: ['version_specifiers', 'github']
    # bad

    gem 'foo', github: 'some_account/some_fork_of_foo'

    gem 'bar', '< 2.1'

    # good

    # Using this fork because baz
    gem 'foo', github: 'some_account/some_fork_of_foo'

    # Version 2.1 introduces breaking change baz
    gem 'bar', '< 2.1'
