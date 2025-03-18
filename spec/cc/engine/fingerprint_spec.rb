# frozen_string_literal: true

require "spec_helper"
require "cc/engine/fingerprint"

module CC::Engine
  describe Fingerprint do
    describe "#compute" do
      it "returns a fingerprint for method/class offenses" do
        cop_name = "Metrics/ModuleLength"
        path = "foo/bar.rb"
        message = "foo"

        computed = Fingerprint.new(path, cop_name, message).compute

        expect(computed).to eq "53a5f182884e58dcb16d24fca37e10bc"
      end

      it "returns nil for non method/class offenses" do
        cop_name = "Style/Foo"
        path = "foo/bar.rb"
        message = "foo"

        computed = Fingerprint.new(path, cop_name, message).compute

        expect(computed).to be_nil
      end

      it "computes same fingerprint regardles of message url detail" do
        cop_name = "Metrics/ModuleLength"
        path = "foo/bar.rb"

        plain = "Metrics/MethodLength: Method has too many lines. [18/10]"
        verbose = "Metrics/MethodLength: Method has too many lines. [18/10]  (https://github.com/bbatsov/ruby-style-guide#short-methods)"

        verbose_print = Fingerprint.new(path, cop_name, verbose).compute
        plain_print = Fingerprint.new(path, cop_name, plain).compute

        expect(verbose_print).to eq plain_print
      end

      it "computes same fingerprint regardles of line number detail" do
        old_count = "Metrics/MethodLength: Method has too many lines. [20/10]"
        improved_count = "Metrics/MethodLength: Method has too many lines. [18/10]"

        cop_name = "Metrics/ModuleLength"
        path = "foo/bar.rb"

        old_fingerprint = Fingerprint.new(path, cop_name, old_count).compute
        improved_fingerprint = Fingerprint.new(path, cop_name, improved_count).compute

        expect(old_fingerprint).to eq improved_fingerprint
      end
    end
  end
end
