# frozen_string_literal: true

module RuboCopCopNodeLoc
  # RuboCop's default implementation of `add_offense` in `Cop` only gets the
  # location of the keyword associated with the problem which, for things
  # like complexity checkers, is just the method def line. This isn't very
  # useful for checkers where the entire method body is relevant. Fetching
  # this information from an `Offense` instance is difficult, since the
  # original AST is no longer available. So it's easier to monkey-path
  # this method on complexity checkers to send the location of the entire
  # method to the created `Offense`.
  def add_offense(node, location: :expression, message: nil, severity: nil, &block)
    super(node, location: node.loc, message: message, severity: severity, &block)
  end
end

[
  RuboCop::Cop::Metrics::AbcSize,
  RuboCop::Cop::Metrics::BlockLength,
  RuboCop::Cop::Metrics::ClassLength,
  RuboCop::Cop::Metrics::CyclomaticComplexity,
  RuboCop::Cop::Metrics::MethodLength,
  RuboCop::Cop::Metrics::ModuleLength,
  RuboCop::Cop::Metrics::PerceivedComplexity,
].each do |cop_class|
  cop_class.prepend RuboCopCopNodeLoc
end
