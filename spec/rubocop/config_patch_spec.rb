# frozen_string_literal: true

require "spec_helper"

module CC::Engine
  describe "Rubocop config patch" do
    it "prevents config from raising on obsolete cops" do
      config = RuboCop::Config.new(
        {
          "Style/TrailingComma" => {
            "Enabled" => true
          }
        },
        ".rubocop.yml"
      )

      expect do # Suppress output
        expect { config.validate }.to_not raise_error
      end.to output(//).to_stderr
    end

    it "warns about obsolete cops" do
      config = RuboCop::Config.new(
        {
          "Layout/AlignArguments" => {
            "Enabled" => true
          }
        },
        ".rubocop.yml"
      )

      expected = <<~EOM
        The `Layout/AlignArguments` cop has been renamed to `Layout/ArgumentAlignment`.
        (obsolete configuration found in .rubocop.yml, please update it)
      EOM

      expect { config.validate }.to output(expected).to_stderr
    end

    it "warns about removed cops" do
      config = RuboCop::Config.new(
        {
          "Style/TrailingComma" => {
            "Enabled" => true
          }
        },
        ".rubocop.yml"
      )

      expected = <<~EOM
        The `Style/TrailingComma` cop has been removed. Please use `Style/TrailingCommaInArguments`, `Style/TrailingCommaInArrayLiteral` and/or `Style/TrailingCommaInHashLiteral` instead.
        (obsolete configuration found in .rubocop.yml, please update it)
      EOM

      expect { config.validate }.to output(expected).to_stderr
    end
  end
end
