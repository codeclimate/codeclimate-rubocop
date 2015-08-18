# Monkey patching! Here be dragons.
module RuboCop
  module Cop
    module MethodComplexity
      def add_offense(node, loc, message = nil, severity = nil)
        super(node, node.loc, message, severity)
      end
    end
  end
end
