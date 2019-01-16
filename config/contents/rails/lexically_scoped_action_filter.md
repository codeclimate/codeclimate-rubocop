This cop checks that methods specified in the filter's `only` or
`except` options are defined within the same class or module.

You can technically specify methods of superclass or methods added
by mixins on the filter, but these confuse developers. If you
specify methods that are defined in other classes or modules, you
should define the filter in that class or module.

### Example:
    # bad
    class LoginController < ApplicationController
      before_action :require_login, only: %i[index settings logout]

      def index
      end
    end

    # good
    class LoginController < ApplicationController
      before_action :require_login, only: %i[index settings logout]

      def index
      end

      def settings
      end

      def logout
      end
    end

### Example:
    # bad
    module FooMixin
      extend ActiveSupport::Concern

      included do
        before_action proc { authenticate }, only: :foo
      end
    end

    # good
    module FooMixin
      extend ActiveSupport::Concern

      included do
        before_action proc { authenticate }, only: :foo
      end

      def foo
        # something
      end
    end