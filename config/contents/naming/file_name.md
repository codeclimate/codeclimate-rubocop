Makes sure that Ruby source files have snake_case
names. Ruby scripts (i.e. source files with a shebang in the
first line) are ignored.

The cop also ignores `.gemspec` files, because Bundler
recommends using dashes to separate namespaces in nested gems
(i.e. `bundler-console` becomes `Bundler::Console`). As such, the
gemspec is supposed to be named `bundler-console.gemspec`.

When `ExpectMatchingDefinition` (default: `false`) is `true`, the cop requires
each file to have a class, module or `Struct` defined in it that matches
the filename. This can be further configured using
`CheckDefinitionPathHierarchy` (default: `true`) to determine whether the
path should match the namespace of the above definition.

When `IgnoreExecutableScripts` (default: `true`) is `true`, files that start
with a shebang line are not considered by the cop.

When `Regex` is set, the cop will flag any filename that does not match
the regular expression.

### Example:
    # bad
    lib/layoutManager.rb

    anything/usingCamelCase

    # good
    lib/layout_manager.rb

    anything/using_snake_case.rake