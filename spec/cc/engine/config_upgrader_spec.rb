# frozen_string_literal: true

require "spec_helper"
require "cc/engine/config_upgrader"

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
        Layout/EmptyLinesAroundAttributeAccessor:
          Enabled: true
        Layout/SpaceAroundMethodCallOperator:
          Enabled: false
        Lint/DeprecatedOpenSSLConstant:
          Enabled: false
        Lint/DuplicateElsifCondition:
          Enabled: false
        Lint/MixedRegexpCaptureTypes:
          Enabled: true
        Lint/RaiseException:
          Enabled: false
        Lint/StructNewOverride:
          Enabled: false
        Style/AccessorGrouping:
          Enabled: true
        Style/BisectedAttrAccessor:
          Enabled: true
        Style/AccessorMethodName:
          Enabled: false
        Style/ArrayCoercion:
          Enabled: false
        Style/CaseLikeIf:
          Enabled: false
        Style/ExponentialNotation:
          Enabled: false
        Style/FrozenStringLiteralComment:
          Enabled: false
        Style/HashAsLastArrayItem:
          Enabled: false
        Style/HashEachMethods:
          Enabled: true
        Style/HashLikeCase:
          Enabled: false
        Style/HashTransformKeys:
          Enabled: true
        Style/HashTransformValues:
          Enabled: true
        Style/RedundantAssignment:
          Enabled: true
        Style/RedundantFetchBlock:
          Enabled: true
        Style/SlicingWithRange:
          Enabled: true
        Style/RedundantFileExtensionInRequire:
          Enabled: false
        Style/RedundantRegexpCharacterClass:
          Enabled: true
        Style/RedundantRegexpEscape:
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
