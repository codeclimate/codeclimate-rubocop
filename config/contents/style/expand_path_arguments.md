Checks for use of the `File.expand_path` arguments.
Likewise, it also checks for the `Pathname.new` argument.

Contrastive bad case and good case are alternately shown in
the following examples.

### Example:
    # bad
    File.expand_path('..', __FILE__)

    # good
    File.expand_path(__dir__)

    # bad
    File.expand_path('../..', __FILE__)

    # good
    File.expand_path('..', __dir__)

    # bad
    File.expand_path('.', __FILE__)

    # good
    File.expand_path(__FILE__)

    # bad
    Pathname(__FILE__).parent.expand_path

    # good
    Pathname(__dir__).expand_path

    # bad
    Pathname.new(__FILE__).parent.expand_path

    # good
    Pathname.new(__dir__).expand_path
