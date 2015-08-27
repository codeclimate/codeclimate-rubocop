# Code Climate Rubocop Engine

[![Code Climate](https://codeclimate.com/repos/55ccc68e6956802d030012f3/badges/fce009562bca1c1fc8dc/gpa.svg)](https://codeclimate.com/repos/55ccc68e6956802d030012f3/feed)

`codeclimate-rubocop` is a Code Climate engine that wraps the [RuboCop](https://github.com/bbatsov/rubocop) static analysis tool. You can run it on your command line using the Code Climate CLI, or on our hosted analysis platform.

RuboCop helps you enforce many of the guidelines outlined in the community [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide). Most aspects of its behavior can be tweaked via various [configuration options](https://github.com/bbatsov/rubocop/blob/master/config/default.yml), which are set in a **.rubocop.yml** file.

### Installation

1. If you haven't already, [install the Code Climate CLI](https://github.com/codeclimate/codeclimate).
2. Run `codeclimate engines:enable rubocop`. This command both installs the engine and enables it in your `.codeclimate.yml` file.
3. You're ready to analyze! Browse into your project's folder and run `codeclimate analyze`.

### Need help?

For help with RuboCop, [check out their documentation](https://github.com/bbatsov/rubocop).

If you're running into a Code Climate issue, first look over this project's [GitHub Issues](https://github.com/codeclimate/codeclimate-rubocop/issues), as your question may have already been covered. If not, [go ahead and open a support ticket with us](https://codeclimate.com/help).
