Each gem in the Gemfile should have a comment explaining
its purpose in the project, or the reason for its version
or source.

The optional "OnlyFor" configuration array
can be used to only register offenses when the gems
use certain options or have version specifiers.

When "version_specifiers" is included, a comment
will be enforced if the gem has any version specifier.

When "restrictive_version_specifiers" is included, a comment
will be enforced if the gem has a version specifier that
holds back the version of the gem.

For any other value in the array, a comment will be enforced for
a gem if an option by the same name is present.
A useful use case is to enforce a comment when using
options that change the source of a gem:

- `bitbucket`
- `gist`
- `git`
- `github`
- `source`

For a full list of options supported by bundler,
see https://bundler.io/man/gemfile.5.html
.

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

### Example: OnlyFor: ['restrictive_version_specifiers']
    # bad

    gem 'foo', '< 2.1'

    # good

    gem 'foo', '>= 1.0'

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
