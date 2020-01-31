# frozen_string_literal: true

require "rubocop/config"

module RuboCopConfigRescue
  def reject_obsolete_cops_and_parameters
    super
  rescue RuboCop::ValidationError => e
    warn e.message
  end

  def alert_about_unrecognized_cops(_)
    super
  rescue RuboCop::ValidationError => e
    warn e.message
  end
end

RuboCop::ConfigObsoletion.prepend RuboCopConfigRescue
RuboCop::ConfigValidator.prepend RuboCopConfigRescue
