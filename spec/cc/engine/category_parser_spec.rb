require "spec_helper"
require "cc/engine/category_parser"

module CC::Engine
  describe CategoryParser do
    it "returns a category for the cop name" do
      CategoryParser.new("Rails/Delegate").category.must_equal("Clarity")
    end

    it "returns a category for the cop" do
      CategoryParser.new("Performance/Sup").category.must_equal("BugRisk")
    end

    it "returns a default" do
      CategoryParser.new("Sup").category.must_equal("Style")
    end
  end
end
