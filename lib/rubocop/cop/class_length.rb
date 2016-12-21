# frozen_string_literal: true

RuboCop::Cop::Metrics::ClassLength.module_eval do
  def check_code_length(node, *_)
    length = code_length(node)
    return unless length > max_length

    add_offense(node, node.loc, message(length, max_length)) do
      self.max = length
    end
  end
end
