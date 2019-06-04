require "spec_helper"

module CC::Engine
  describe ConfigUpgrader do
    include RubocopRunner

    it "upgrades old configs" do
      create_source_file("test.rb", <<~CODE)
        # frozen_string_literal: true

        def get_true
          true
        end
      CODE
      create_source_file(".rubocop.yml", <<~CONFIG)
        Style/AccessorMethodName:
          Enabled: false
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
