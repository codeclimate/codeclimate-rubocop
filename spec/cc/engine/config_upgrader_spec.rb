# frozen_string_literal: true

require "spec_helper"

module CC::Engine
  describe ConfigUpgrader do
    include RubocopRunner

    it "upgrades old configs" do
      create_source_file("test.rb", <<~CODE)
        def get_true
          true
        end
      CODE
      create_source_file(".rubocop.yml", <<~CONFIG)
        Layout/SpaceAroundMethodCallOperator:
          Enabled: false
        Lint/RaiseException:
          Enabled: false
        Lint/StructNewOverride:
          Enabled: false
        Style/AccessorMethodName:
          Enabled: false
        Style/ExponentialNotation:
          Enabled: false
        Style/FrozenStringLiteralComment:
          Enabled: false
        Style/HashEachMethods:
          Enabled: true
        Style/HashTransformKeys:
          Enabled: true
        Style/HashTransformValues:
          Enabled: true
      CONFIG

      # No warnings about obsolete cop name
      expect do
        run_engine
      end.to_not output.to_stderr

      # Properly applied config
      expect(issues).to be_empty
    end
  end
end
