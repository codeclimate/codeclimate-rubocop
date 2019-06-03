This cop makes sure that Ruby source files have snake_case
names. Ruby scripts (i.e. source files with a shebang in the
first line) are ignored.

The cop also ignores `.gemspec` files, because Bundler
recommends using dashes to separate namespaces in nested gems
(i.e. `bundler-console` becomes `Bundler::Console`). As such, the
gemspec is supposed to be named `bundler-console.gemspec`.

### Example:
    # bad
    lib/layoutManager.rb

    anything/usingCamelCase

    # good
    lib/layout_manager.rb

    anything/using_snake_case.rake