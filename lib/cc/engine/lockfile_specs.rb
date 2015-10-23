class LockfileSpecs
  def initialize(lockfile)
    @lockfile = lockfile
  end

  def include?(name)
    return false unless File.exist?(@lockfile)

    File.open(@lockfile) do |file|
      file.each_line.any? { |line| line =~ /#{name}/ }
    end
  end
end
