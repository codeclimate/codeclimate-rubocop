require "bundler"

class LockfileSpecs
  def initialize(lockfile)
    @contents = File.read(lockfile) if File.exist?(lockfile)
  end

  def include?(name)
    return false if @contents.nil?
    @lockfile ||= Bundler::LockfileParser.new(@contents)
    @lockfile.specs.any? { |spec| spec.name == name }
  rescue Bundler::LockfileError
    false
  end
end
