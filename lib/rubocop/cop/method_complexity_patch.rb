# frozen_string_literal: true

# Monkey patching! Here be dragons.
RuboCop::Cop::MethodComplexity.module_eval do
  # RuboCop's default implementation of `add_offense` in `Cop` only gets the
  # location of the keyword associated with the problem which, for things
  # like complexity checkers, is just the method def line. This isn't very
  # useful for checkers where the entire method body is relevant. Fetching
  # this information from an `Offense` instance is difficult, since the
  # original AST is no longer available. So it's easier to monkey-path
  # this method on complexity checkers to send the location of the entire
  # method to the created `Offense`.
  def add_offense(node, _loc, message = nil, severity = nil)
    super(node, node.loc, message, severity)
  end
end
