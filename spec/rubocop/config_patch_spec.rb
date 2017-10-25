# frozen_string_literal: true

require "spec_helper"

module CC::Engine
  describe "Rubocop config patch" do

    it "prevents config from raisong on obsolete cops" do
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
          "Style/TrailingComma" => {
            "Enabled" => true
          }
        },
        ".rubocop.yml"
      )

      expect { config.validate }.to output(
        %r{Warning: unrecognized cop Style/TrailingComma found in .rubocop.yml}
      ).to_stderr
    end
  end
end
