lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "spritpreisrechner/version"

Gem::Specification.new do |spec|
  spec.name = "spritpreisrechner"
  spec.version = Spritpreisrechner::VERSION
  spec.authors = ["Marco Roth"]
  spec.email = ["marco.roth@intergga.ch"]

  spec.summary = "Ruby Wrapper for the e-control.at Spritpreisrechner HTTP API"
  spec.description = "Ruby Wrapper for the e-control.at Spritpreisrechner HTTP API"
  spec.homepage = "https://github.com/marcoroth/spritpreisrechner-ruby"
  spec.license = "MIT"

  spec.files = `git ls-files`.split("\n")
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "faraday"
  spec.add_dependency "json"
end
