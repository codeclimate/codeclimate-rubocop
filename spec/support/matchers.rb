require 'rspec/expectations'

RSpec::Matchers.define :include_fingerprint do |fingerprint|
  match do |issues|
    issues.any? { |i| i["fingerprint"] == fingerprint }
  end
end

RSpec::Matchers.define :include_check do |cop_name|
  match do |issues|
    issues.any? { |i| i["check_name"] =~ /#{cop_name}$/ }
  end
end
