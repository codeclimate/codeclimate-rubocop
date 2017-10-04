# frozen_string_literal: true

Rake.add_rakelib "lib/tasks"

begin
  require "rspec/core/rake_task"

  RSpec::Core::RakeTask.new(:spec)
  task default: :spec
rescue LoadError
end
