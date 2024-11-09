# frozen_string_literal: true

require "spec_helper"
require "cc/engine/category_parser"

module CC::Engine
  describe CategoryParser do
    it "returns the category mapped to the full cop name if present" do
      category_parser = CategoryParser.new("Rails/Delegate")

      expect(category_parser.category).to eq("Clarity")
    end

    it "returns the category mapped to the cop category if present" do
      category_parser = CategoryParser.new("Rails/ScopeArgs")

      expect(category_parser.category).to eq("Bug Risk")
    end

    it "returns Style as the default" do
      category_parser = CategoryParser.new("Pretend")

      expect(category_parser.category).to eq("Style")
    end
  end
end
