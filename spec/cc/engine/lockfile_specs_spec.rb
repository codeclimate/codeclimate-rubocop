require "spec_helper"
require "cc/engine/lockfile_specs"

module CC::Engine
  describe LockfileSpecs do
    describe "#include?" do
      before do
        @specs = LockfileSpecs.new("./spec/fixtures/Gemfile.lock")
      end

      it "returns true when spec is include in Gemfile.lock" do
        @specs.include?("ansi").must_equal(true)
        @specs.include?("i18n").must_equal(true)
        @specs.include?("astrolabe").must_equal(true)
      end

      it "returns false when spec not include in Gemfile.lock" do
        @specs.include?("railties").must_equal(false)
        @specs.include?("pants").must_equal(false)
        @specs.include?("python").must_equal(false)
      end

      it "returns false when no Gemfile.lock file is found" do
        specs = LockfileSpecs.new(SecureRandom.hex(32))

        specs.include?("ansi").must_equal(false)
      end
    end
  end
end
