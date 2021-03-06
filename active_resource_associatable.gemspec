# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_resource_associatable/version'

Gem::Specification.new do |spec|
  spec.name          = "active_resource_associatable"
  spec.version       = ActiveResourceAssociatable::VERSION
  spec.authors       = ["Neeraj Kumar"]
  spec.email         = ["neeraj.kumar@gmail.com"]

  spec.summary       = %q{This rubygem is used to build the connection between any ActiveResource model and ActiveRecord model.}
  spec.description   = %q{This rubygem is used to build the connection between any ActiveResource model and ActiveRecord model.}
  spec.homepage      = "https://github.com/neerajkumar/active_resource_associatable."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "activeresource", "~> 4.0.0"
  spec.add_development_dependency "activesupport", "~> 4.2.5"
  spec.add_development_dependency "activerecord", "~> 4.2.5"
  spec.add_development_dependency "factory_girl"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "byebug"

  spec.add_dependency "json"
end
