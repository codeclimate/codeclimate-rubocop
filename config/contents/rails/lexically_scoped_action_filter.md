This cop checks that methods specified in the filter's `only` or
`except` options are defined within the same class or module.

You can technically specify methods of superclass or methods added by
mixins on the filter, but these can confuse developers. If you specify
methods that are defined in other classes or modules, you should
define the filter in that class or module.

If you rely on behaviour defined in the superclass actions, you must
remember to invoke `super` in the subclass actions.

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

### Example:
    class ContentController < ApplicationController
      def update
        @content.update(content_attributes)
      end
    end

    class ArticlesController < ContentController
      before_action :load_article, only: [:update]

      # the cop requires this method, but it relies on behaviour defined
      # in the superclass, so needs to invoke `super`
      def update
        super
      end

      private

      def load_article
        @content = Article.find(params[:article_id])
      end
    end