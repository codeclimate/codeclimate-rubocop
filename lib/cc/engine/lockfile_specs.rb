require "bundler/lockfile_parser"

class LockfileSpecs
  def initialize(lockfile)
    if File.exist?(lockfile)
      @contents = File.read(lockfile)
    else
      @contents = ""
    end
  end

  def include?(name)
    @lockfile ||= Bundler::LockfileParser.new(@contents)
    @lockfile.specs.any? { |spec| spec.name == name }
  rescue Bundler::LockfileError
    false
  end
end
